class Api::WorkoutsController < ApplicationController
  
  before_action :authenticate_user

  def index
    @workouts = current_user.workouts
    render 'index.json.jb'
  end

  def show
    @workout = Workout.find_by(id: params[:id])
    if current_user.id == @workout.user_id
      render 'show.json.jb'
    else
      render json: {message: "User does not match"}
    end
  end

  def create
    @workout = Workout.new(
      name: params[:name],
      date: params[:date],
      category: params[:category],
      note: params[:note],
      user_id: current_user.id
    )
    if @workout.save
      render 'show.json.jb'
    else
      render json: {errors: @workout.errors.full_messages}, status: 422  
    end
  end

  def update
    @workout = Workout.find_by(id: params[:id])
    @workout.name = params[:name] || @workout.name
    @workout.date = params[:date] || @workout.date
    @workout.category = params[:category] || @workout.category
    @workout.note = params[:note] || @workout.note
    if @workout.save
      render 'show.json.jb'
    else
      render json: {errors: @workout.errors.full_messages}, status: 422
    end
  end

  def destroy
    @workout = Workout.find_by(id: params[:id])
    if current_user.id == @workout.user_id
      workout.destroy
      render json: {message: "Workout destroyed"}
    else
      render json: {message: "User does not match"}
    end
  end
end
