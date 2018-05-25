class Api::OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id)
  end
end
