class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :deli_day

  belongs_to :user
  # has_one :pay

  validates :image, presence: true , unless: :was_attached?
  validates :title          ,presence: true
  validates :content        ,presence: true
  validates :price          ,presence: true
  validates :usre           ,presence: true

  # 選択しないとエラーメッセージを表示させる
  validates :category_id, 
            :status_id, 
            :postage_id, 
            :prefecture_id, 
            :deli_day_id, 
            numericality: { other_than: 1 , message: "can't be blank"}
end