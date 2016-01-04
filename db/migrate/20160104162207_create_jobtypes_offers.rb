class CreateJobtypesOffers < ActiveRecord::Migration
  def change
    create_table :jobtypes_offers, id: false do |t|
      t.integer :offer_id
      t.integer :jobtype_id

      t.timestamps null: false
    end
    add_index :jobtypes_offers, ["offer_id", "jobtype_id"], :unique => true
    add_foreign_key :jobtypes_offers, :offer_id, on_delete: :cascade
    add_foreign_key :jobtypes_offers, :jobtype_id, on_delete: :cascade
  end
end
