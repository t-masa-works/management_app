class AddEndTimeToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :end_time, :datetime, null: false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
