class AddDivisionToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :projects, :string
    add_column :projects, :division, :integer
  end
end
