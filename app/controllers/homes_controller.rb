class HomesController < ApplicationController
  def top
    @posts = Post.all # 投稿をすべて取得
  end
end
