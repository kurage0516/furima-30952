class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,     presence: true
  validates :surname,      presence: true
  validates :name,         presence: true
  validates :surname_ruby, presence: true
  validates :name_ruby,    presence: true
  validates :birthday,     presence: true
end