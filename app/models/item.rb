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
    validates :product_name
    validates :text
    validates :category_id, numericality: { greater_than: 1 }
    validates :product_state_id, numericality: { greater_than: 1 }
    validates :delivery_fee_id, numericality: { greater_than: 1 }
    validates :area_id, numericality: { greater_than: 1 }
    validates :day_id, numericality: { greater_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
