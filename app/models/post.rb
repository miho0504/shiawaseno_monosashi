class Post < ApplicationRecord
  belongs_to :user
  
  validates :today_mood, presence: true
  validates :content, length: { maximum: 30 } 
  validates :user_id, {
  uniqueness: {scope: :user_id,conditions: -> { where('created_at >= ?', 1.days.ago) },}
  }
  
  enum today_mood: { ⭕️: 0, 🔺: 1, ❌: 2 }
  
  
end
