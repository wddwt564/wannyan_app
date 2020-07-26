class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], room_id: comment_params[:room_id], user_id: current_user.id)
    redirect_to "/rooms/#{@comment.room.id}"
  end
  
  def destroy
    Comment.find(params[:id]).destroy
  end
  
  private
  def comment_params
    params.permit(:text, :room_id)
  end
end
