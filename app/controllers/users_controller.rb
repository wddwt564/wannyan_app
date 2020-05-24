class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @myroom = Room.order('id DESC').limit(5)
    @myroom = @user.rooms.includes(:user).order('id DESC').limit(5)
  end
    #   @tweet = Tweet.find(params[:id])
    # @comments = @tweet.comments.includes(:user)
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
