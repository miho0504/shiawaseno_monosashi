class Post < ApplicationRecord
  validates :today_mood, presence: true
  validates :content, length: { maximum: 30 } 
  enum today_mood: { ⭕️: 0, 🔺: 1, ❌: 2 }
end
