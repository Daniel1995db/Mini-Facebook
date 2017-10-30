class MessagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_chatroom


  def index
    @messages = Message.all
  end

  def show
  end

  def create
    message = @chatroom.messages.new(message_params)
    message.user = current_user
    p message
    message.save
    redirect_to @chatroom
    MessageRelayJob.perform_later(message)
  end

  private

    def set_chatroom
      @chatroom = Chatroom.find(params[:chatroom_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end

end