class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @myroom = @user.rooms.includes(:user).order('id DESC').limit(5)
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
  
  def redirect
    if User.where.not(name: nil).exists?
    redirect_to :root
    else
    end
  end
  
  
end
