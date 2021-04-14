class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @currentUserChat=Chat.where(user_id: current_user.id)
    @userChat=Chat.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserChat.each do |cu|
      @userChat.each do |u|
        if cu.room_id == u.room_id then
          @isRoom = true
          @roomId = cu.room_id
        end
      end
    end
    unless @isRoom
      @room = Room.new
      @chat = Chat.new
    end
   end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
      redirect_to user_path
  else
    render :edit
  end
end

  private

  def user_params
    params.require(:user).permit(:name, :email,:image,:image_cache)
  end
end
