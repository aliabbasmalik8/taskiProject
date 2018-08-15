class AddCompletedToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :complted, :boolean
  end
end
