class PayDeli
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :pay_id, :token
  with_options presence: true do
    validates :postcode        ,presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is not a valid format" }
    validates :city            ,presence: true
    validates :block           ,presence: true
    validates :phone_number    ,presence: true, format: { with: /\A\d{10,11}\z/, message: "Postcode is not a valid format"}
  end

  validates :prefecture_id   ,presence: true , numericality: {other_than: 1, message: "can't be blank"}
  validates :token, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
 
  def save
    # payに保存するカラム
    pay = Pay.create( user_id: user_id, item_id: item_id)
    # deliに保存するカラム
    Deli.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, pay_id: pay.id)
  end


end