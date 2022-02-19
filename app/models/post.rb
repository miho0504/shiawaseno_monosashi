class Post < ApplicationRecord
  validates :today_mood, presence: true
  validates :title,    length: { maximum: 30 } 
  enum today_mood: { ⭕️: 0, 🔺: 1, ❌: 2 }
end
