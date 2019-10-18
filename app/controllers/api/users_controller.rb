class Api::UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      phone_number: params[:phone_number],
      bio: params[:bio],
      misc_info: params[:misc_info]
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email
    @user.password = params[:password] || @user.password
    @user.phone_number = params[:phone_number] || @user.phone_number
    @user.bio = params[:bio] || @user.bio   
    @user.misc_info = params[:misc_info] || @user.misc_info
    if @user.save
      render 'show.json.jb'
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render json: {message: "User destroyed"}
  end

end
