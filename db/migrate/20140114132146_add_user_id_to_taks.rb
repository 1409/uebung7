	class AddUserIdToTaks < ActiveRecord::Migration
  def change
    add_column :taks, :user_id, :integer
    add_index :taks, :user_id
  end
end
