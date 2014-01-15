class AddDelegatedToTasks < ActiveRecord::Migration
  def change
    add_column :taks, :delegated_id, :integer
    add_index :taks, :delegated_id
  end
end
