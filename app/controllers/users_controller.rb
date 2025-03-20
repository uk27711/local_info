class UsersController < ApplicationController
  before_action :authenticate_user!  # サインインしていないユーザーにはアクセスできないようにする
  before_action :correct_user, only: [:edit, :update]

  def new
  end

  def show
    @user = User.find(params[:id])  # ユーザー情報を取得
  end

  def index
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
