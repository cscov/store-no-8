class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to api_user_orders_url(@current_user)
    else
      flash[:errors] = @user.errors.full_messages
    end
  end

  def new
    @user = User.new
    render :new
  end

  def user_params
    params.require(:user).permit(:first_name, :email_address, :password)
  end
end
