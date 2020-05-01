class RoomsController < ApplicationController
  def show
    @room = Room.new
    @rooms = current_user.rooms
  end
  
  def new
    @room = Room.new(create_params)
    @rooms = current_user.rooms
  end
  
  def create
    Room.create(create_params)
  end

  private
  def create_params
    params.require(:room,:user).permit(:text, :image,:user_name).merge(user_id: current_user.id)
  end
  
end