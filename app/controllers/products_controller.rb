class ProductsController < ApplicationController
  before_action :authenticate_user!,except: :user_create
  def show
  end
end
