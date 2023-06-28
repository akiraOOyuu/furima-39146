class Pay < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :deli

  # validates :price, presence:true

end
