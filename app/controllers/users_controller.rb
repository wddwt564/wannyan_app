class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  def update
      current_user.update(update_params)
      
      redirect_back(fallback_location: root_path)
  end
  
    private
  def update_params
    params.require(:user).permit(:user_name, :gender, :age, :profile)
  end
end
