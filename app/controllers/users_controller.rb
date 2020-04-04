class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    render "users/edit"
  end

  def update
  end
  
end
