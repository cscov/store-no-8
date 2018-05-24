class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render json: @user
    else
      render json: @user.errors.full_messages, status: 401
    end
  end

  def new
    @user = User.new
  end

  def user_params(first_name, mail_address, password)
    params.require(:user).permit(first_name, mail_address, password)
  end
end
