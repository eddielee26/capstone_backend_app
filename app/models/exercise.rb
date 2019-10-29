class Exercise < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises

  validates :name, presence: true
  validates :sets, numericality: { greater_than: 0 }
  validates :reps, numericality: { greater_than: 0 }
  validates :weight, numericality: { greater_than: 0 }
end
