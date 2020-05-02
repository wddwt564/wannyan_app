class RoomsController < ApplicationController
  def show
    @room = Room.new
    @rooms = current_user.rooms
  end
  
  def new
    @room = Room.new
    @rooms = current_user.rooms
    @user = User.all
  end
  
  def create
    Room.create(create_params)
  end

  private
  def create_params
    params.require(:room).permit(:text, :image).merge(user_id: current_user.id)
  end
end
