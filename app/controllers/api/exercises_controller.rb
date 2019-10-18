class Api::ExercisesController < ApplicationController
  
  def index
    @exercises = Exercise.all
    render 'index.json.jb'
  end

  def show
    @exercise = Exercise.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @exercise = Exercise.create(
      name: params[:name],
      set: params[:set],
      rep: params[:rep],
      weight: params[:weight],
      image: params[:image],
      video: params[:video],
      muscle_group: params[:muscle_group],
      user_id: params[:user_id]
    )
    if @exercise.save
      render 'show.json.jb'
    else
      render json: {errors: @exercise.errors.full_messages}, status: 422  
    end
  end

  def update
    @exercise = Exercise.find_by(id: params[:id])
    @exercise.name = params[:name] || @exercise.name
    @exercise.set = params[:set] || @exercise.set
    @exercise.rep = params[:rep] || @exercise.rep
    @exercise.weight = params[:weight] || @exercise.weight
    @exercise.image = params[:image] || @exercise.image
    @exercise.video = params[:video] || @exercise.video
    @exercise.muscle_group = params[:muscle_group] || @exercise.muscle_group
    # @exercise.user_id = params[:user_id] || @exercise.user_id
    if @exercise.save
      render 'show.json.jb'
    else
      render json: {errors: @exercise.errors.full_messages}, status: 422
    end
  end

  def destroy
    exercise = Exercise.find_by(id: params[:id])
    exercise.destroy
    render json: {message: "Exercise destroyed"}
  end

end
