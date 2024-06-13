class MessagesController < ApplicationController
  before_action :authenticate_user!

  # POST /messages
  def create
    @meeting = Meeting.find(params[:meeting_id])
    @message = Message.new(message_params)

    @message.meeting = @meeting
    @message.user = current_user

    chaperone_bot = User.find_by(email: "chaperone@chaperone.com")

    if @message.save
      # Broadcast the message to the chat channel
      ActionCable.server.broadcast "meeting_chat_#{@message.meeting_id}_channel", {
        message: render_message(@message)
      }
      @gpt_message = Message.new(content: gpt_response)
      @gpt_message.user = chaperone_bot
      @gpt_message.meeting = @meeting
      @gpt_message.save
      ActionCable.server.broadcast "meeting_chat_#{@message.meeting_id}_channel", {
        message: render_message(@gpt_message)
      }
      head :ok
    else
      render "meetings/chat", status: :unprocessable_entity
    end
  end

  def gpt_response
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [
        {role: "system", content: "You are Chaperone, a safe, secure, and friendly assistant designed to support users on dates. Your primary role is to provide comfort, reassurance, and practical advice to users who may feel uncomfortable or anxious. Respond with empathy, understanding, and helpful suggestions to ensure the user feels safe and supported at all times."},
        {role: "user", content: params["message"]["content"]}],
    })
    return chaptgpt_response["choices"][0]["message"]["content"]
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
