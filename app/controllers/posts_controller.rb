class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
  end
  
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title, :image)
  end
end
