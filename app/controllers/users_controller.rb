class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @myroom = Room.order('id DESC').limit(5)
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
