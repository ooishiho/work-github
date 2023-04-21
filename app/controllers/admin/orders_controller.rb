class Admin::OrdersController < ApplicationController
  def show
   
   @order.making_status = params[:order][:making_status]
  end

  def update
  end
end
