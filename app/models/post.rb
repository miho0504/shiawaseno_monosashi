class Post < ApplicationRecord
  belongs_to :user
  
  validates :today_mood, presence: true
  validates :content, length: { maximum: 30 } 
  enum today_mood: { ⭕️: 0, 🔺: 1, ❌: 2 }
  validate :diary
  
  private

  def diary
    if Post.where('created_at >= ?', Date.today).present?
      errors.add(:content,"の投稿は1日1回までです")
    end
  end
end
