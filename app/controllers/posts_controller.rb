class PostsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :authorized_user, only: [:edit, :update, :destroy]

  def index
    @search = Post.ransack(params[:q])
    # @all_posts = Post.all
    @all_posts = @search.result
  end

  def find
    @all_posts = Post.all.sorted
  end

  def new
    if logged_in?
      @post = Post.new
    else
      flash[:notice] = "Wow! You\'re not even logged in."
      render('sessions/new')
    end
  end

  def create
    @post = Post.new(post_params)
    # use the id of the signed in user to create a post
    @post.author = current_user if current_user
    if @post.save
      flash[:notice] = "Post created successfully."
      redirect_to(posts_path)
    else
      render('new')
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated successfully."
      redirect_to(post_path(@post))
    else
      render('edit')
    end
  end

  def delete
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "Post deleted successfully."
    redirect_to(posts_path)
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :date, :start_time, :end_time)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:notice] = "Wow! You\'re not even logged in."
        redirect_to(login_path)
      end
    end

    # Confirms the correct user
    def authorized_user
      @post = Post.find(params[:id])
      flash[:notice] = "You\'re not allowed to do that."
      redirect_to(root_path) unless current_user?(@post.author)
    end
end
