class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.create(user_params)
          

    redirect_to post_path(params[:post_id])    
  end

  private

  def user_params
    params.require(:user).permit(:username, comments_attributes: [:content, :post_id])
  end

end
