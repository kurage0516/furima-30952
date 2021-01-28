class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :day
  belongs_to :delivery_fee
  belongs_to :product_state

  belongs_to       :user
  has_one_attached :image

  with_options presence: true do
    validates :image,            unless: :was_attached?
    validates :text
    validates :category_id
    validates :product_state_id
    validates :delivery_fee_id
    validates :area_id
    validates :day_id
    validates :price,            format: { with: /\A[０-９]+\z/}, numericality: { greater_than_or_equal_to: 300 }, numericality: { less_than_or_equal_to: 9999999 }
  end

  def was_attached?
    self.image.attached?
  end

end
