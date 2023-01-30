class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[create index]
  before_action :set_user, only: %i[show destroy]

  # GET /users
  def index
    @users = Account.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = Account.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :username, :email, :password)
  end

  def set_user
    @user = Account.find(params[:id])
  end
end
