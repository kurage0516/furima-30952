class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :product_state

  belongs_to       :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :text
    validates :category_id
    validates :product_state_id
    validates :delivery_fee_id
    validates :area_id
    validates :day_id
    validates :price,            format: { with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300 ,less_than_or_equal_to: 9999999}
  end

end
