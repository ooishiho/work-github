class Public::CartItemsController < ApplicationController

  def index
  @cart_items = CartItem.all
  @cart_items.each do |cart_item|
    
  end
  end

  def create
      binding.pry
  end

  def destory
  end

  def destroy_all
  CartItem.destroy_all
  redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
