class ChangeNameColumnOnUsers < ActiveRecord::Migration[6.0]
  def up
    change_column_null :users, :name, false, 0
  end

  def down
    change_column_null :users, :name, true, nil
  end
end