class ItemsController < ApplicationController
  
  def index
   @items = Item.all
  end

  def new
   
   @item = Item.new
  end

  def create
   @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

#   def show

#   end
# end

private

    def item_params
      params.require(:items).permit( 
        :title,
        :content,
        :category_id,
        :status_id,
        :postage_id,
        :prefecture_id,
        :deli_day_id,
        :price).merge(user_id: current_user.id)
  end
end
