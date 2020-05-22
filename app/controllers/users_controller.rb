class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @myroom = Room.find(id: @user.user_id).order('id DESC').limit(5)
  end
  
  def edit
  end
  
  def update
      current_user.update(update_params)
  end
  
    private
  def update_params
    params.require(:user).permit(:user_name, :gender, :age, :profile,:image)
  end
end
