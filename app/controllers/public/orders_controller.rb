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
  params[:order][:select_address]
  @order = Order.new(order_params)
  @order.postal_code = current_customer.postal_code
  @order.address = current_customer.address
  @order.name = current_customer.first_name + current_customer.last_name
    if params[:order][:select_address] == "1"
     @order.name = current_customer.name
     @order.address = current_customer.customer_address
    elsif params[:order][:select_address] == "2"
    if Address.exists?(name: params[:order][:registered])
      @order.name = Address.find(params[:order][:registered]).name
      @order.address = Address.find(params[:order][:registered]).address
    else
      render :new
    end
    end
 end

 private

 def order_params
   params.require(:order).permit(:payment_method, :postal_code, :address, :name)
 end
end
