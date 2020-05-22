class UsersController < ApplicationController
  def show
    # @user = User.find(params[:id])
    # @myroom = Room.find(params[:id]).order('id DESC').limit(5)
    @user = Room.find_by(id: params[:id])
    @myroom = User.find_by(id: @user.user_id)
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
