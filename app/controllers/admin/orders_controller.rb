class Admin::OrdersController < ApplicationController
  def show
   @order = Order.find(params[:id])
   @customer = @order.customer
   @order_details = @order.order_details
  # @order.making_status = params[:order][:making_status]
  end

  def update
   @order = Order.find(params[:id])
   @order_details = OrderDetail.where(order_id: params[:id])
   if @order.update(order_params)
    @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
   end
   redirect_to admin_order_path(@order.id)

  end

  private

   def order_params
   params.require(:order).permit(:payment_method,:shipping_cost,:total_payment, :postal_code, :address, :name,:status)
   end
end
