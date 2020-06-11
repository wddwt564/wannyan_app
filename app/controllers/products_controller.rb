class ProductsController < ApplicationController
  before_action :authenticate_user!,except: :user_create
  def show
    @room = Room.new
    @allrooms = Room.all.order('id DESC').limit(5)
  end
  
  def category
    @room_dog = Room.where("genre = 'イヌ'")
  end
end
