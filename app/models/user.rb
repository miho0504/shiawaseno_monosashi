class User < ApplicationRecord
  
  # ユーザーとの投稿アソシエーション
  has_many :posts, dependent: :destroy
  
  # UserとRelationshipの関連付け
  # フォローできるユーザーを取り出す
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  # フォローしているユーザーを取り出す
  has_many :followings, through: :following_relationships

  # フォローされているユーザーを取り出す
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  # フォローしている User 達を取得
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
  
  # ユーザーランダムIDの生成
  generate_public_uid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
