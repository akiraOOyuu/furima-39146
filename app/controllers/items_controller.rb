class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :restrict_direct_access, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update ]


  def index
   @items = Item.all.order("created_at DESC")
   
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

  def show
    
  end

  def edit
  end

  def update
    if @item.update(item_params)
    redirect_to item_path(@item)
    else
      render :edit
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

    def item_params
      params.require(:item).permit( 
        :image, 
        :title, 
        :content, 
        :category_id, 
        :status_id, 
        :postage_id, 
        :prefecture_id, 
        :deli_day_id, 
        :price
        ).merge(user_id: current_user.id)

    end
    def set_item
      @item = Item.find(params[:id])
    end
    def restrict_direct_access
     if request.referrer.nil? || URI(request.referrer).host != request.host
       redirect_to root_path
     end
    end
end
