class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      render :json => @user
    else
      render :json => @user.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.try(:destroy)
    render :json => {message: "#{@user.username} has been destroyed!"}
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
