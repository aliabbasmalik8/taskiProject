class RemoveDivisionFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :division, :integer
  end
end
