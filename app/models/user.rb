class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password,               format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
    validates :surname,                format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :name,                   format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :surname_ruby,           format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :name_ruby,              format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end

  has_many :items
  has_many :purchase_histories
end
