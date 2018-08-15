class AddStageToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :stage, :integer
  end
end
