class AddPriorityToTasksNotnullAndDefault < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :priority, :integer, null: false, default: 0
  end
end
