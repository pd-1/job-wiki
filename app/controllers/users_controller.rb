class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @currentUserChat=Chat.where(user_id: current_user.id)
    @userChat=Chat.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserChat.each do |cu|
      @userChat.each do |u|
        if cu.room_id == u.room_id then
          @isRoom = true
          @roomId = cu.room_id
        end
      end
    end
    if @isRoom
    else
      @room = Room.new
      @chat = Chat.new
    end
   end
  end
end
