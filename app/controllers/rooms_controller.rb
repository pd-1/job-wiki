class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    @chat1 = Chat.create(room_id: @room.id, user_id: current_user.id)
    @chat2 = Chat.create(params.require(:chat).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}" 
  end

  def show
    @room = Room.find(params[:id])
    if Chat.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @chats = @room.chats
    else
      redirect_to root_path
    end
  end
end
