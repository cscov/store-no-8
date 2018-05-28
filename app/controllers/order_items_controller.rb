class OrderItemsController < ApplicationController
  before_action :require_login

  def create
    @order_item = OrderItem.new
    @order_item.order_id = params[:order_id]
    @order_item.item_id = params[:item_id]

    redirect_to user_order_url(user_id: current_user.id, id: @order_item.order_id)
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order_item.destroy!
    redirect_to user_order_url(user_id: current_user.id, id: order_item.order_id)
  end


  private

  def order_item_params
    params.require(:order_items).permit(:order_id, :item_id)
  end
end
