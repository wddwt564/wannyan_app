class UsersController < ApplicationController
  
    before_action :redirect, only: :new
  def show
    if User.where.(deleted_at: nil).exists?
    @user = User.find(params[:id])
    @myroom = @user.rooms.includes(:user).order('id DESC').limit(5)
    else
    redirect_to :root
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
