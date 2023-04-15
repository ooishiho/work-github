class Public::AddressesController < ApplicationController

  def index
  @addresses = Address.all
  end

  def create
  @address = Address.new(address_params)
  @address.save
  redirect_to public_addresses_path
  end

  def edit
  @address = Address.find(params[:id])
  @address.update(address_params)
  redirect_to public_address_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end
end
