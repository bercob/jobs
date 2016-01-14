class CreateOffercategoriesOffers < ActiveRecord::Migration
  def change
    create_table :offercategories_offers, id: false do |t|
      t.integer :offer_id, null: false
      t.integer :offercategory_id, null: false
    end

    add_index :offercategories_offers, %w(offer_id offercategory_id), unique: true

    add_foreign_key :offercategories_offers, :offer_id, on_delete: :cascade
    add_foreign_key :offercategories_offers, :offercategory_id, on_delete: :cascade
  end
end
