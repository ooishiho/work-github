class Admin::OrderDetailsController < ApplicationController
  def update
   @order_details = OrderDetail.find(params[:id])
   @order_details.update(order_params)
   @order = @order_details.order
   if @order_details.making_status ==  "in_production"
    @order.update(status: "in_production")
   else
     count = 0
     @order_details.order.order_details.each do |order_detail|
    if order_detail.making_status == "production_completed"
       count += 1
    end
   end
   if count == @order_details.order.order_details.count
      @order.update(status: "preparing_to_ship")
   end
   end
   redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
     params.require(:order_detail).permit(:making_status)
  end
end
