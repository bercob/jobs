class CreateOfferpositionsOffers < ActiveRecord::Migration
  def change
    create_table :offerpositions_offers, id: false do |t|
      t.integer :offer_id
      t.integer :offerposition_id

      t.timestamps null: false
    end
    add_index :offerpositions_offers, ["offer_id", "offerposition_id"], :unique => true
    add_foreign_key :offerpositions_offers, :offer_id, on_delete: :cascade
    add_foreign_key :offerpositions_offers, :offerposition_id, on_delete: :cascade
  end
end
