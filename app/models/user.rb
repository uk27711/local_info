class User < ApplicationRecord
  has_one_attached :profile_image  # ここで画像をアタッチする
  has_many :posts # ユーザーが投稿した画像

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def get_profile_image(width, height)
    if profile_image.attached?
      profile_image.variant(resize_to_limit: [width, height]).processed
    else
      'no_image.png'
    end
  end
end
