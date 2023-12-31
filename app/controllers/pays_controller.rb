class PaysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :restrict_direct_access, only: [:index , :create]

  


  def index
    @pay_deli = PayDeli.new
  end
  
  def create
        @pay_deli = PayDeli.new(pay_params)
      if @pay_deli.valid?
        @pay_deli.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

    def set_item
      @item = Item.find(params[:item_id])
    end

    def pay_params 
      params.require(:pay_deli).permit(
        :postcode, 
        :prefecture_id, 
        :city, 
        :block,
        :building, 
        :phone_number
        ).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: pay_params[:token],
        currency: 'jpy')
      end
      
      def restrict_direct_access
        if @item.pay.present? || @item.user_id == current_user.id
          redirect_to root_path 

        end
    end
end