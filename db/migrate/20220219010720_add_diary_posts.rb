class AddDiaryPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :today_mood, :integer
    add_column :posts, :user_id, :integer
  end
end
