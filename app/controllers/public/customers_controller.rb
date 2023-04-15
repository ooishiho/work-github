class Public::CustomersController < ApplicationController

 def show
  @customer = current_customer
 end

 def edit
  @customer = current_customer
 end

 def update
  @customer = Customer.find(params[:id])
  @customer.update(customer_params)
  redirect_to public_customers_my_page_path
 end


 def unsubscribe
 end

 def withdraw
 end

 private

 def customer_params
   params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephon_nunber,:email)
 end
end
