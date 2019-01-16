class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @comment.user.build
  end

  def create
    
    if comment_params[:user_id].empty?
      user = User.create(comment_params[:user_attributes])
      comment = Comment.create(content: comment_params[:content], post_id: comment_params[:post_id], user:user)
    else
      comment = Comment.create(content: comment_params[:content], post_id: comment_params[:post_id])
      user = User.find(comment_params[:user_id])
      comment.user = user
      comment.save
      
    end
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
