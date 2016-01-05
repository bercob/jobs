class CreateOfferregions < ActiveRecord::Migration
  def change
    create_table :offerregions do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :offerregions, :name, unique: true
  end
end
