class Api::WorkoutsController < ApplicationController
  
  def index
    @workouts = Workout.all
    render 'index.json.jb'
  end

  def show
    @workout = Workout.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @workout = Workout.create(
      date: params[:date],
      category: params[:category],
      note: params[:note],
      user_id: params[:user_id]
    )
    if @workout.save
      render 'show.json.jb'
    else
      render json: {errors: @workout.errors.full_messages}, status: 422  
    end
  end

  def update
    @workout = Workout.find_by(id: params[:id])
    @workout.date = params[:date] || @workout.date
    @workout.category = params[:category] || @workout.category
    @workout.note = params[:note] || @workout.note
    # @workout.user_id = params[:user_id] || @workout.user_id
    if @workout.save
      render 'show.json.jb'
    else
      render json: {errors: @workout.errors.full_messages}, status: 422
    end
  end

  def destroy
    workout = Workout.find_by(id: params[:id])
    workout.destroy
    render json: {message: "Workout destroyed"}
  end
  
end
