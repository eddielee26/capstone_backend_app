class RenameSetToSets < ActiveRecord::Migration[6.0]
  def change
    rename_column :exercises, :set, :sets
  end
end
