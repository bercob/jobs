class CreateOfferSources < ActiveRecord::Migration
  def change
    create_table :offer_sources do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :offer_sources, :name, unique: true
  end
end
