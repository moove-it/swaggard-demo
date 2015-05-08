# @tag User posts
class PostsController < ApplicationController

  before_action :set_user
  before_action :set_post, only: [:show, :update, :destroy]

  # Get user posts
  #
  # @response_class Array<PostSerializer>
  def index
    @posts = Post.all

    render json: @posts
  end

  # Get user post
  #
  # @response_class PostSerializer
  def show
    render json: @post
  end

  # Create user post
  #
  # @body_parameter [string] title
  # @body_parameter [string] body
  #
  # @response_class PostSerializer
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # Update user post
  #
  # @body_parameter [string] title
  # @body_parameter [string] body
  #
  # @response_class PostSerializer
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      head :no_content
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # Delete user post
  def destroy
    @post.destroy

    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'User not found' }, status: :unprocessable_entity
  end

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Post not found' }, status: :unprocessable_entity
  end

  def post_params
    params.permit(:title, :body).merge(user: @user)
  end

end