class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @user = User.new
    @comment = Comment.new
    
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.categories.build
  end

  def create
    
    post = Post.create(post_params)
    redirect_to post
  end

  def update
    

    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name], comment:[:content, :user_id])
  end
end
