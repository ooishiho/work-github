class Admin::OrdersController < ApplicationController
  def show
   @order = Order.find(params[:id])
   @customer = @order.customer
   @order_details = @order.order_details
  # @order.making_status = params[:order][:making_status]
  end

  def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   redirect_to admin_order_path(@order.id)

  end

  private

   def order_params
   params.require(:order).permit(:payment_method,:shipping_cost,:total_payment, :postal_code, :address, :name)
   end
end
