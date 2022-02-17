class ChangePointColumnOnPost < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :name, false, 0
  end
end
