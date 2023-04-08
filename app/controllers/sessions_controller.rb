class SessionsController < ApplicationController
before_action :customer_state, only: [:create]

  protected

  def customer_state
   @customer = Customer.find_by(email: params[:customer][:email])
   return if !@customer
   if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted == true
   redirect to new_customer_registration
   end
  end
end