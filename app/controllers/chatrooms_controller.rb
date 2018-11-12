class ChatroomsController < ApplicationController
  def show
    # @chatroom = Chatroom.find_by(slug: params[:slug])
    @chatroom = Chatroom.first
    @message = Message.new
  end
end
