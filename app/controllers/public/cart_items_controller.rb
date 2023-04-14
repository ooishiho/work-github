class Public::CartItemsController < ApplicationController

  def index
  @cart_items = CartItem.all
  end

  def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.item_id = @curt_item
  @cart_item.customer_id = current_customer.id
  @cart_item.save!
  redirect_to public_cart_items_path
      # binding.pry
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
