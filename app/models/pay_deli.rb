class PayDeli
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token
  with_options presence: true do
    validates :postcode        ,format: { with: /\A\d{3}[-]\d{4}\z/, message: "is not a valid format" }
    validates :city 
    validates :block
    validates :phone_number     ,format: {with: /\A\d{10,11}\z/, message: "is not a valid format"}
    validates :prefecture_id    , numericality: {other_than: 1, message: "can't be blank"}
    validates :token
    
  end
    validates :user_id, presence: true
    validates :item_id, presence: true

  def save
    # payに保存するカラム
    pay = Pay.create( user_id: user_id, item_id: item_id)
    # deliに保存するカラム
    Deli.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, pay_id: pay.id)
  end


end