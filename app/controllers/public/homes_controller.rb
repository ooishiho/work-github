class Public::HomesController < ApplicationController

 def top
 @items = Item.order("created_at DESC").page(params[:page]).per(4)
 end
end
