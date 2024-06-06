class MeetingChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "meeting_chat_#{params[:meeting_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
