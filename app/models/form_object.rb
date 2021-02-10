class Form_object
  include ActiveModel::Model
  attr_accessor :postal_code,:area_id,:municipality,:address,:building_name,:phone_number

  presence: true do
    validates :postal_code,   format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/}
    validates :area_id,       numericality: { greater_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number,  format: { with: /\A\d{10,11}\z/}
  end

  validates :building_name

  def save
    purchase_history = Purchase_history.create(user_id: user.id, item_id: item.id)
    Purchase_domicile.create(postal_code: postal_code, area_id: area.id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_history: purchase_history, )
  end
end