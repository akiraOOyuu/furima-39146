class PaysController < ApplicationController

  def index
    @pays = Pay.new
    @item = Item.find(params[:item_id])
  end
  def create
    @pay = Pay.new(pay_params)
    @item = Item.find(params[:item_id])
    @pay.item = @item 
    if @pay.valid?
      @pay.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

def pay_params
  params.permit(item_attributes: [:id, :price], user_attributes: [:id])
  end
end
