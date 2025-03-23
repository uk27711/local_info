class Post < ApplicationRecord
  belongs_to :user  # ユーザーと関連づける

  has_one_attached :image # ActiveStorageを使用する場合 # 投稿画像

end
