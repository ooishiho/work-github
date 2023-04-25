class Admin::OrderDetailsController < ApplicationController
  def update
   @order.order_details = Order.find(params[:id])
   @order.details.update(order_params)
   redirect_to admin_order_path(@order.id)
  end

  private

  def order_details
     params.require(:order_detail).permit(:making_status)
  end
end
