class CreateOfferSources < ActiveRecord::Migration
  def change
    create_table :offer_sources do |t|
      t.string :name

      t.timestamps null: false
    end
    change_column :offer_sources, :name, :string, null: false
    add_index :offer_sources, :name, unique: true
  end
end
