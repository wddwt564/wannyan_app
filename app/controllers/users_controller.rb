class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    render "hoges/hige"
  end

end
