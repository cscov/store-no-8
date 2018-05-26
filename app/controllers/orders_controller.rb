class OrdersController < ApplicationController
  before_action :require_login

  def index
    @orders = @current_user.orders
    @orders.user_id = @current_user.id
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = @current_user.id
    if @order.save
      redirect_to api_user_order_url(@order)
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
      redirect_to api_user_order_url(@order)
    else
      flash[:errors] = @order.errors.full_messages
      render :edit
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def destroy
    order = current_user.orders.find(params[:id])
    delete(order)
    redirect_to api_user_orders_url
  end

  def order_params
    params.require(:order).permit(:user_id)
  end

end
