class MessagesController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    if Chat.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
      render json:{ message: @message }
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to room_path
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
  end

end
