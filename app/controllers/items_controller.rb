class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :restrict_direct_access, only: [:edit, :update, :destroy]


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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
   
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
    redirect_to item_path(@item)
    else
      render :edit
    end
   end
  
  # def destroy
    
  # end

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
  def restrict_direct_access
    if request.referrer.nil? || URI(request.referrer).host != request.host
      redirect_to root_path
    end
  end
 end
