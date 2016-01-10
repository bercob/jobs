class CreateOfferregionsOffers < ActiveRecord::Migration
  def change
    create_table :offerregions_offers, id: false do |t|
      t.integer :offer_id, null: false
      t.integer :offerregion_id, null: false

      t.timestamps null: false
    end
    add_index :offerregions_offers, %w(offer_id offerregion_id), unique: true
    add_foreign_key :offerregions_offers, :offer_id, on_delete: :cascade
    add_foreign_key :offerregions_offers, :offerregion_id, on_delete: :cascade
  end
end
