class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :external_offer_id
      t.date :offerdate
      t.datetime :last_update
      t.string :position
      t.string :location
      t.string :content
      t.string :url
      t.string :company
      t.string :ico

      t.timestamps null: false
    end
    add_index :offers, :external_offer_id
  end
end
