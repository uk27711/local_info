class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # 認証が必要なアクション
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end

  def show
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
      redirect_to user_path(@post.user), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy # 投稿を削除
    redirect_to posts_path, notice: '投稿が削除されました。' # 投稿一覧ページにリダイレクト
  end

  private

  def set_post
    @post = Post.find(params[:id]) # 投稿をIDで検索
  end

  def post_params
    params.require(:post).permit(:title, :image, :body)
  end
end
