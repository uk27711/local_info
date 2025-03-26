class UsersController < ApplicationController
  before_action :authenticate_user!  # サインインしていないユーザーにはアクセスできないようにする
  before_action :correct_user, only: [:edit, :update]

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else 
      render :edit, alert: 'Failed to update user.'
    end
  end

  def unsubscribe
    # ユーザー情報を取得（ログインしているユーザーを想定）
    @user = current_user
  end

  def withdraw
    @user = current_user

    if @user.update(status: 'withdrawn') # ステータスを 'withdrawn' に更新
      sign_out @user # ログアウト処理
      redirect_to root_path, notice: '退会処理が完了しました。'
    else
      redirect_to unsubscribe_users_path, alert: '退会処理に失敗しました。'
    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to user_path(current_user), alert: "You are not authorized to edit this user."
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

