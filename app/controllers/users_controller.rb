class UsersController < ApplicationController
  
    before_action :redirect, only: :new
  def show
    @user = User.find(params[:id])
    @myroom = @user.rooms.includes(:user).order('id DESC').limit(5)
    if User.where.not(deleted_at: nil).exists?
      redirect_to root_path
    end
  end
  
  def edit
  end
  
  def update
      current_user.update(update_params)
  end
  
  
  def destroy
  end
  
  
    private
  def update_params
    params.require(:user).permit(:user_name, :gender, :age, :profile,:image)
  end
  
  
end
