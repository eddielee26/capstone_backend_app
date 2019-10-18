class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :set
      t.integer :rep
      t.integer :weight
      t.string :image
      t.string :video
      t.string :muscle_group
      t.integer :user_id

      t.timestamps
    end
  end
end
