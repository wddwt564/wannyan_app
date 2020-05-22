class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @myroom = Room.find(params[:id]).order('id DESC').limit(5)
    @users = Room.find_by(id: params[:id])
    @myroom = User.find_by(id: @users.user_id)
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
