class RoomsController < ApplicationController
  
  def index
    @rooms = current_user.rooms.order("id DESC")
  end
  
  
  def show
    @myroom = Room.find(params[:id])
    @post = Room.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end
  
  def new
    @room = Room.new
    @rooms = current_user.rooms
  end
  
  def create_rooms
  end
  
  def create
    @user = Room.create(create_params)
    if @user.save
      redirect_to  action: :create_rooms
    else
      # render 'new'ではなく、teaser_pathへ遷移
      redirect_to teaser_path
    end
  end

def create_rooms
end


  private
  def create_params
    params.require(:room).permit(:text, :image, :room_name, :genre).merge(user_id: current_user.id)
  end
end
