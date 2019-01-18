class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end

  def create
    @user = User.find_or_create_by(username: params[:username])
    new_comment = @user.comments.build(content: params[:user][:comments][:content], post_id: params[:user][:comments][:post_id])
    if new_comment.content == ""
      redirect_to post_path(new_comment.post)
    else
      new_comment.save
      redirect_to post_path(new_comment.post)
    end
  end

end
