class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(10)
    @item_all = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :anme, :price)
  end
end
