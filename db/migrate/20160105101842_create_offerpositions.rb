class CreateOfferpositions < ActiveRecord::Migration
  def change
    create_table :offerpositions do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :offerpositions, :name, unique: true
  end
end
