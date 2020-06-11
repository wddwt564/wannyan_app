class ProductsController < ApplicationController
  before_action :authenticate_user!,except: :user_create
  def show
    @room = Room.new
    @allrooms = Room.all.order('id DESC').limit(5)
  end
  
  def category
    @room_dog = Room.where("genre = 'イヌ'")
    @room_cat = Room.where("genre = 'ネコ'")
    @room_cat = Room.where("genre = 'ウサギ'")
    @room_cat = Room.where("genre = 'その他'")
  end
end
