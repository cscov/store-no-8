class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_credentials(params[:user][:email_address],
                                    params[:user][:password])
    if @user
      login(@user)
      redirect_to user_orders_url(@user)
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
