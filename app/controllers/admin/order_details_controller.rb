class Admin::OrderDetailsController < ApplicationController
  def update
   @order_details = OrderDetail.find(params[:id])
   @order_details.update(order_params)
   @order = @order_details.order
   redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
     params.require(:order_detail).permit(:making_status)
  end
end
