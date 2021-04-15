class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
    @currentChats = current_user.chats
    myRoomIds = []
  
    @currentChats.each do |chat|
      myRoomIds << chat.room.id
    end
  
    @anotherChats = Chat.where(room_id: myRoomIds).where(user_id: @user.ids).where.not(user_id: current_user.id)
  end

  def create
    @room = Room.create
    @chat1 = Chat.create(room_id: @room.id, user_id: current_user.id)
    @chat2 = Chat.create(chat_params)
    redirect_to "/rooms/#{@room.id}" 
  end

  def show
    @room = Room.find(params[:id])
    @user = User.where(params[:user_id])
    gon.user_name = current_user.name
    if Chat.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @chats = @room.chats
    else
      redirect_to root_path
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
