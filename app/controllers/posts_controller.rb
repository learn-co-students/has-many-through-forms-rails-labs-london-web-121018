class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @user = User.new
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    2.times {Category.new}
  end

  def create
    
    categoryids = post_params[:category_ids].delete_if{|i| i==""}
    if categoryids.empty? && post_params[:categories_attributes_0][:name].empty?
      post = Post.create(title: post_params[:title], content: post_params[:content])      
    elsif categoryids.empty? && !post_params[:categories_attributes_0][:name].empty?
      post = Post.create(title: post_params[:title], content: post_params[:content])     
      category = Category.create(name: post_params[:categories_attributes_0][:name])
      post.categories << category
      post.save
    elsif !categoryids.empty? && !post_params[:categories_attributes_0][:name].empty?
      post = Post.create(title: post_params[:title], content: post_params[:content])     
      category1 = Category.create(name: post_params[:categories_attributes_0][:name])
      post.categories << category1
      post.save
      categoryids.each do |id|
        category = Category.find(id)
        post.categories << category
      end
        post.save
    else
      post = Post.create(title: post_params[:title], content: post_params[:content])
      categoryids.each do |id|
        category = Category.find(id)
        post.categories << category
      end
        post.save
    end

    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes_0: [:name])
  end
end
