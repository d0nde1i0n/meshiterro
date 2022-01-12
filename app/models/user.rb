class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # PostImageモデルとの関連付け
  has_many :post_images, dependent: :destroy
  #ActiveStorageに"profile_image"という名前のプロフィール画像を保存する設定
  has_one_attached :profile_image

  def get_profile_image
    unless profile_image.attached?
      # プロフィール画像が存在しない場合
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path),filename:'default-image,jpg',content_type: 'image/jpeg')
    end
    # プロフィール画像が存在する場合
    profile_image.variant(resize:"100x100").processed
  end
end
