class PostsController < ApplicationController

  def index
    @all_posts = Post.all
  end

  def find
    @all_posts = Post.all
  end

  def new
    if logged_in?
      @post = Post.new
    else
      render 'sessions/new'
    end
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
