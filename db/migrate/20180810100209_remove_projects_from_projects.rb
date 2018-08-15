class RemoveProjectsFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :projects, :string
  end
end
