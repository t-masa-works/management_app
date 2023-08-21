class AddDefaultToStatusInTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :status, :integer, null: false, default: 0
  end
end
