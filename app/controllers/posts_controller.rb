class PostsController < ApplicationController
  #before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "Post was successfully created"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    if @post.destroy
      flash[:success] = "Post was successfully deleted"
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong"
      redirect_to posts_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
