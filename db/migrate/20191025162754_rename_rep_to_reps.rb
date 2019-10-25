class RenameRepToReps < ActiveRecord::Migration[6.0]
  def change
    rename_column :exercises, :rep, :reps
  end
end
