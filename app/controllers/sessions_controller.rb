class SessionsController < ApplicationController
  # サインイン画面を表示するアクション
  def new
  end

  # サインイン処理を行うアクション
  def create
    user = User.find_by(email: params[:session][:email]) #ユーザーmailで検索
    if user && user.authenticate(params[:session][:password]) # ユーザーが存在し、パスワードが合っていれば
      session[:user_id] = user.id  # セッションにユーザーIDを保存
      redirect_to user_path(user), notice: 'Successfully signed in.'
    else
      flash.now[:alert] = 'Invalid username or password'
      render :new
    end
  end

  # サインアウト処理を行うアクション
  def destroy
    session[:user_id] = nil  # セッションからユーザーIDを削除
    redirect_to root_path, notice: 'You have signed out.'
  end
end
