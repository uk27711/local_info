class UsersController < ApplicationController
  before_action :authenticate_user!  # ユーザーがサインインしていることを確認
  before_action :correct_user, only: [:edit, :update]

  def new
  end

  def show
    @user = current_user  # サインインしたユーザーの情報を取得
  end

  def index
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:title, :body, :image)
  end
end
