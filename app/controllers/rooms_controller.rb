class RoomsController < ApplicationController
  
  def index
    @users = User.find(params[:id])
    @myroom = @users.rooms.includes(:user).order('id DESC').limit(5)
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
    Room.create(create_params)
    # redirect_to :action => 'create_rooms'
    redirect_to  action: :create_rooms
    
  end

def create_rooms
end


  private
  def create_params
    params.require(:room).permit(:text, :image, :room_name, :genre).merge(user_id: current_user.id)
  end
end
