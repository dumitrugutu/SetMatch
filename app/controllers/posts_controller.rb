class PostsController < ApplicationController

  include UsersHelper

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # use the id of the signed in user to create a post
    @post.user = current_user if current_user
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :date, :start_time, :end_time)
    end
end
