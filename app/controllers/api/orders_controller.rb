class Api::OrdersController < ApplicationController
  def index
    @current_user.orders
  end

  def new
    @order = Order.new
  end
 
  def create
    @order = Order.new
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

  end

end
