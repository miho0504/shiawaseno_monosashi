class User < ApplicationRecord
  
  # ユーザーとの投稿アソシエーション
  has_many :posts, dependent: :destroy
  
  # ユーザーフォロー関係
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  # 自分自身をフォローできないようにする
  def follow(other_user)
    return if self == other_user
    relationships.find_or_create_by!(follower: other_user)
  end

  # フォローしているか確認する
  def following?(user)
    followings.include?(user)
  end

  # 　フォローをはずす
  def unfollow(relathinoship_id)
    relationships.find(relathinoship_id).destroy!
  end
  
  # ユーザーランダムIDの生成
  generate_public_uid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
