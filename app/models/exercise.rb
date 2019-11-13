class Exercise < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises

  validates :name, presence: true
  validates :sets, :reps, :weight, numericality: { greater_than: -1 }
end
