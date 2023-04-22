class Public::OrdersController < ApplicationController

 def new
   @order = Order.new
   @order.customer_id = current_customer
 end

 def index
   @orders = Order.all
 end

 def show
   @order = Order.find(params[:id])
 end

 def create
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id

   @order.save
   cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
# 取り出したカートアイテムの数繰り返します
# order_item にも一緒にデータを保存する必要があるのでここで保存します
      order = OrderDetail.new
      order.item_id = cart_item.item_id
      order.price = cart_item.item.price
      order.amount = cart_item.amount
      order.order_id = @order.id
# 購入が完了したらカート情報は削除するのでこちらに保存します
# カート情報を削除するので item との紐付けが切れる前に保存します
      order.save
    end
   cart_items.destroy_all
   redirect_to public_orders_complete_path
 end

 def complete
 end

 def confirm
  @address = current_customer
  @cart_items = current_customer.cart_items

#   params[:order][:select_address]
  @order = Order.new(order_params)
  @order.shipping_cost = 800
  @order.payment_method = params[:order][:payment_method]
    if params[:order][:select_address] == "1"
     @order.name = current_customer.last_name
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
    elsif params[:order][:select_address] == "2"
     if Address.exists?(id: params[:order][:address_id])
      @order.name = Address.find(params[:order][:address_id]).name
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      @order.address = Address.find(params[:order][:address_id]).address
     end
    elsif params[:order][:select_address] == "3"
     @order.name = current_customer.last_name
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
    end
   # byebug
 end

 private

 def order_params
   params.require(:order).permit(:payment_method,:shipping_cost,:total_payment, :postal_code, :address, :name)
 end
end
