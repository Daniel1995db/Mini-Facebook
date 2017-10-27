class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatrooms.each do |chatroom| 
      stream_from "chatrooms:#{chatroom.id}"
    end
  end
    # stream_from "some_channel"

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end
end
