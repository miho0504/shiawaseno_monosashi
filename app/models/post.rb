class Post < ApplicationRecord
  belongs_to :user
  
  validates :today_mood, presence: true
  validates :content, length: { maximum: 30 } 
  
  # 1日1回迄の投稿制限
  validate :diary_limit, on: :create
  
  # 今日の感情表示
  enum today_mood: { ◯: 0, △: 1, ×: 2 }
  
  private
  
  # 1日1回迄の投稿制限
  def diary_limit
    if Post.where(user_id: user.id).where("start_time > ?", Date.today).present?
      errors.add(:content,"の投稿は1日1回までです")
    end
  end
end
