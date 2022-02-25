class ChangePointColumnOnPostmood < ActiveRecord::Migration[6.0]
  def change
    change_column_null :posts, :today_mood, false, 0
  end
end
