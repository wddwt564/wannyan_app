class ProductsController < ApplicationController
  before_action :authenticate_user!,except: :user_create
  def show
    @room = Room.new
    @allrooms = Room.all.order('id DESC').limit(5)
  end
  
  def category
    @room_dog = Room.where("genre = 'イヌ'")
    # @room_rabbit = Room.where("genre = 'ウサギ'")
    # @room_other = Room.where("genre = 'その他'")
    # @room_search = Room.search(params[:search])
  end
  
  def category2
    @room_cat = Room.where("genre = 'ネコ'")
  end
  
  
  def search
     @room_search = Room.search(params[:search])
  end
  
end
