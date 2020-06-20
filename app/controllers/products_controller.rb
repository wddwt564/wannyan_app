class ProductsController < ApplicationController
  before_action :authenticate_user!,except: :user_create
  def show
    @room = Room.new
    @allrooms = Room.all.order('id DESC').limit(5)
  end
  
  def category_dog
    @room_dog = Room.where("genre = 'イヌ'").order('id DESC')
  end
  
  def category_cat
    @room_cat = Room.where("genre = 'ネコ'").order('id DESC')
  end
  
  def category_rabbit
    @room_rabbit = Room.where("genre = 'ウサギ'").order('id DESC')
  end
  
  def category_other
    @room_other = Room.where("genre = 'その他'").order('id DESC')
  end
  
  
  def search
     @room_search = Room.search(params[:search]).order('id DESC')
  end
  
end
