class PaysController < ApplicationController
  before_action :restrict_direct_access, only: [:index, :create]
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
        Payjp.api_key = "sk_test_6eb5e5b08d486702b90f50d6"
        Payjp::Charge.create(
          amount: @item.price,
          card: pay_params[:token],
          currency: 'jpy'
        )
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
        :pay_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end
    def restrict_direct_access
      if request.referrer.nil? || URI(request.referrer).host != request.host
        redirect_to root_path
      end
    end
  end
