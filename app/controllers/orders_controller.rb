require 'byebug'
class OrdersController < ApplicationController
  before_action :require_login

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.user_id = params[:user_id]
    if @order.save
      redirect_to user_order_url(user_id: params[:user_id], id: @order.id)
    else
      flash[:errors] = @order.errors.full_messages
      render :new
    end
  end

  def edit
    @order = current_user.orders.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes
      redirect_to user_order_url(@order)
    else
      flash[:errors] = @order.errors.full_messages
      render :edit
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def destroy
    debugger
    order = current_user.orders.find(params[:id])
    order.destroy!
    redirect_to user_orders_url
  end


  private

  def order_params
    params.require(:order).permit(:user_id)
  end

end
