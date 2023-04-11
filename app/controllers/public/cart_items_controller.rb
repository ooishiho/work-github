class Public::CartItemsController < ApplicationController

  def index
  @cart_items = CartItem.all
  end

  def create
      binding.pry
  end

  def destory
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
