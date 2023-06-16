class ItemsController < ApplicationController
  
  def index
   @items = Item.all
  end

  def new
   
   @item = Item.new
  end

  def create
    @item = Item.find(params[:id])
  end

#   def show

#   end
# end


end
