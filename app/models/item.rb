class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :deli_day
  has_one_attached :image

  belongs_to :user
  # has_one :pay

  
  validates :title          ,presence: true
  validates :content        ,presence: true
  validates :price          ,presence: true
  validates :user           ,presence: true
  validates :image          ,presence: true, unless: :was_attached?

  # 選択しないとエラーメッセージを表示させる
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :deli_day_id, numericality: { other_than: 1 , message: "can't be blank"}

  def was_attached?
    self.image.attached?
  end
end