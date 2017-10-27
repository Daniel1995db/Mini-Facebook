class ConversationsController < ApplicationController

  def index
    @conversations = current_user.mailbox
  end

end