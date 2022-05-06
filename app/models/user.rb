class User < ApplicationRecord
  
  # ユーザーとの投稿アソシエーション
  has_many :posts, dependent: :destroy
  
  # ゲストログイン機能
  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
  # ユーザーランダムIDの生成
  generate_public_uid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
