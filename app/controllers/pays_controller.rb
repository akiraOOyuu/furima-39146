class PaysController < ApplicationController

  def index
    @pays = Pay.new
    @item = Item.new
    @item = Item.find(params[:id])
  end
  def create
    @pay = Pay.new(pay_params)
    if @pay.valid?
      @pay.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def pay_params
    params.require(:pay).permit(:price)
  end
end
