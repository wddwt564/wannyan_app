class ProductsController < ApplicationController
  before_action :authenticate_user!,except: :user_create
  def show
    @room = room.new
  end
  
  def index
    @room = room.new
  end
  
end
