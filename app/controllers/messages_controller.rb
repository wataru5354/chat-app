class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @messages = @room.messages.new(message_params)
    if @messages.save
      redirect_to room_messages_path(@room)
    else
      render :new
    end
    
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

end
