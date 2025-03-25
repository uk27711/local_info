class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # 認証が必要なアクション
  before_action :set_post, only: [:show, :edit, :update, :destroy, :delete_image]

  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.includes(:user).all # ユーザー情報も一緒にロード
  end

  def show
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy # 投稿を削除
    redirect_to posts_path, notice: '投稿が削除されました。' # 投稿一覧ページにリダイレクト
  end

  def delete_image
    if @post.image.attached?
      @post.image.purge # 画像を削除
      redirect_to edit_post_path(@post), notice: 'Image was successfully deleted.' # 編集ページにリダイレクト
    else
      redirect_to edit_post_path(@post), alert: 'No image to delete.' # 画像がない場合
    end
  end

  private

  def set_post
    @post = Post.find(params[:id]) # 投稿をIDで検索
  end

  def post_params
    params.require(:post).permit(:title, :image, :body)
  end
end
