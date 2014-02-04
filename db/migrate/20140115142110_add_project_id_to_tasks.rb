class AddProjectIdToTasks < ActiveRecord::Migration
  def change
    add_column :tas, :project_id, :integer
    add_index :tas, :project_id
  end
end
