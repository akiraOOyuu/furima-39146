class PaysController < ApplicationController

  def index
    @pay_deli = PayDeli.new
    @item = Item.find(params[:item_id])
    @pays = Pay.all
  end
  
  def create
    @item = Item.find(params[:item_id])
    @pay_deli = PayDeli.new(pay_params)
    if @pay_deli.valid?
       @pay_deli.save
       redirect_to root_path
    else
      render :index
    end
     
     
  end

  private
  def pay_params 
    params.require(:pay_deli).permit(
      :postcode, 
      :prefecture_id, 
      :city, 
      :block,
      :building, 
      :phone_number,
      :pay_id).merge(item_id: params[:item_id], user_id: current_user.id)
  end
 end
