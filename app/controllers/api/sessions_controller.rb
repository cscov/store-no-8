class Api::SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_credential(params[:user][:email_address],
                                    params[:user][:password])
    if @user
      login(@user)
      render api_user_orders
    else
      flash[:errors] = ["Invalid password/email combination"]
      render :new
    end
  end

  def destroy
    logout
    render :new
  end
end
