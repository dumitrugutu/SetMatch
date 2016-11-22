class PostsController < ApplicationController

  def index
    all_posts = Post.all
    @mondays = all_posts.select { |post| post.date.strftime("%A") == "Monday" if post.date }
    @tuesdays = all_posts.select { |post| post.date.strftime("%A") == "Tuesday" if post.date }
    @wednesdays = all_posts.select { |post| post.date.strftime("%A") == "Wednesday" if post.date }
    @thursdays = all_posts.select { |post| post.date.strftime("%A") == "Thursday" if post.date }
    @fridays = all_posts.select { |post| post.date.strftime("%A") == "Friday" if post.date }
    @saturdays = all_posts.select { |post| post.date.strftime("%A") == "Saturday" if post.date }
    @sundays = all_posts.select { |post| post.date.strftime("%A") == "Sunday" if post.date }
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
