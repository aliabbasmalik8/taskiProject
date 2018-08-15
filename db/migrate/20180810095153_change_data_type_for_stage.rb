class ChangeDataTypeForStage < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :stage, :string
  end
end
