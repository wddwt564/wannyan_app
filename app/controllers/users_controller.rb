class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]).and(User.where(deleted_at: nil))
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
end
