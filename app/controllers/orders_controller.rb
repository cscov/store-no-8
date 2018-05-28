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
    @order = current_user.orders.find_by(params[:id], params[:user_id])
  end

  def show
    @order = current_user.orders.find_by(params[:id], params[:user_id])
  end

  def destroy
    @order = current_user.orders.find_by(id: params[:id], user_id: params[:user_id])
    @order.destroy if @order.order_status != "completed"
    redirect_to user_orders_url(current_user)
  end


  private

  def order_params
    params.require(:order).permit(:user_id)
  end

end
