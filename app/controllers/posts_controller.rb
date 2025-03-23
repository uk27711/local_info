class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
  end
  
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id]) # 投稿をIDで検索して @post に格納
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
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :image, :body)
  end
end
