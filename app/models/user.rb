class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :items
    has_many :pays

    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :nickname, presence:true
      with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
        validates :first_name, presence:true
        validates :last_name, presence:true
      end
      with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
        validates :first_name_reading, presence:true
        validates :last_name_reading, presence:true
      end
    validates :birth_date, presence:true

end

