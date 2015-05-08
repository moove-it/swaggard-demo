# @tag Users
class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]

  # Get users
  #
  # @response_class Array<UserSerializer>
  def index
    @users = User.all

    render json: @users
  end

  # Get user
  #
  # @response_class UserSerializer
  def show
    render json: @user
  end

  # Create user
  #
  # @body_parameter [string] name
  #
  # @response_class UserSerializer
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # Update user
  #
  # @body_parameter [string] name
  #
  # @response_class UserSerializer
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # Delete user
  def destroy
    @user.destroy

    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'User not found' }, status: :unprocessable_entity
  end

  def user_params
    params.permit(:name)
  end

end