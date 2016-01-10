class CreateJobtypes < ActiveRecord::Migration
  def change
    create_table :jobtypes do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :jobtypes, :name, unique: true
  end
end
