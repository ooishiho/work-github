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
   @order.save
   redirect_to public_orders_complete_path
 end

 def complete
 end

 def confirm
  @address = current_customer
  @cart_items = current_customer.cart_items
#   params[:order][:select_address]
  @order = Order.new(order_params)
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
 end

 private

 def order_params
   params.require(:order).permit(:payment_method, :postal_code, :address, :name)
 end
end
