class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @user = User.new
    @categories = @post.categories
    @cat_array = []
    @post.categories.each do |cat|
      @cat_array << cat.name
    end
    @usernames = []
    @comments.each do |com|
      if @usernames.exclude?(com.user.username)
        @usernames << com.user.username
      end
      @usernames
    end
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name], user_ids: [], comments_attributes: [:content, :post_id])
  end
end
