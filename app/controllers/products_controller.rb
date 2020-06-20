class ProductsController < ApplicationController
  before_action :authenticate_user!,except: :user_create
  def show
    @room = Room.new
    @allrooms = Room.all.order('id DESC').limit(5)
  end
  
  def category_dog
    @room_dog = Room.where("genre = 'イヌ'")
    # @room_search = Room.search(params[:search])
  end
  
  def category_cat
    @room_cat = Room.where("genre = 'ネコ'")
  end
  
  def category_rabbit
    @room_rabbit = Room.where("genre = 'ウサギ'")
  end
  
  def category_other
    @room_other = Room.where("genre = 'その他'")
  end
  
  
  def search
     @room_search = Room.search(params[:search])
  end
  
end
