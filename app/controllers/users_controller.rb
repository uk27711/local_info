class UsersController < ApplicationController
  before_action :authenticate_user!  # サインインしていないユーザーにはアクセスできないようにする
  before_action :correct_user, only: [:edit, :update]

  def new
  end

  def show
    @user = current_user
  end

  def index
  end

  def edit
  end

  def update
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
