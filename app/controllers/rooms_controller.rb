class RoomsController < ApplicationController
  
  def index
    @rooms = Room.order('id ASC').find(params[:id])
  end
  
  
  def show
    # @room = Room.all
    # @room_id = Room.find(params[:id])
    # # productsテーブルから最新順に作品を２０件取得する
    # @products = Product.order('id ASC').limit(20)
  end
  
  def new
    @room = Room.new
    @rooms = current_user.rooms
  end
  
  def create
    Room.create(create_params)
    redirect_to :action => 'create_rooms'
  end

def create_rooms
end


  private
  def create_params
    params.require(:room).permit(:text, :image, :room_name, :genre).merge(user_id: current_user.id)
  end
end
