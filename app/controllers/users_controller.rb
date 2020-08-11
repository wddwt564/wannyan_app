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
  
  def hide
    @user = User.find(params[:id])
    #deleted_at カラムにフラグを立てる(defaultはfalse)
    @user.update(deleted_at: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  def destroy
    # @user = User.find(params[:id])
    # @user.destroy
    # reset_session
    # flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    # redirect_to root_path
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  
    private
  def update_params
    params.require(:user).permit(:user_name, :gender, :age, :profile,:image)
  end
end
