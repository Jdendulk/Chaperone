class MessagesController < ApplicationController
  before_action :authenticate_user!

  # POST /messages
  def create
    @meeting = Meeting.find(params[:meeting_id])
    @message = Message.new(message_params)

    @message.meeting = @meeting
    @message.user = current_user

    if @message.save
      # Broadcast the message to the chat channel
      ActionCable.server.broadcast "meeting_chat_#{@message.meeting_id}_channel", {
        message: render_message(@message)
      }
      head :ok
    else
      render "meetings/chat", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
