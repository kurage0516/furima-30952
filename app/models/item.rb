class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :day
  belongs_to :delivery_fee
  belongs_to :product_state

  belongs_to       :user
  has_one_attached :image
end
