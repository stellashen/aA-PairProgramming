class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.user_params
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      render json: user 
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def user_params
    params[:user].permit(:name, :email)
  end
end
