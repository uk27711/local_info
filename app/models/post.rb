class Post < ApplicationRecord
  has_one_attached :image # ActiveStorageを使用する場合
end
