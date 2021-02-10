class CreatePurchaseDomiciles < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_domiciles do |t|
      t.string     :postal_code,        null: false
      t.integer    :area_id,            null: false
      t.string     :municipality,       null: false
      t.string     :address,            null: false
      t.string     :building_name
      t.string     :phone_number,       null: false
      t.references :purchase_history,   foreign_key: true
      t.timestamps
    end
  end
end
