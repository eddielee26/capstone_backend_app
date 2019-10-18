class RenameNotesToNote < ActiveRecord::Migration[6.0]
  def change
    rename_column :workouts, :notes, :note
  end
end
