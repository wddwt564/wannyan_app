class RoomsController < ApplicationController
  def show
    @room = Room.new
  end
  
  def new
    @room = Room.new
    @rooms = current_user.rooms
  end
  
  def create
    Room.create(create_params)
  end

  private
  def create_params
    params.require(:room).permit(:text, :image).merge(user_id: current_user.id)
  end
end
