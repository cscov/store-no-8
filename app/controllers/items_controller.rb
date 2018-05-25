class ItemsController < ApplicationController
  def index
    Index.all
  end

  def show
    @item = Item.find(params[:id])
  end
end
