class CreateJobtypes < ActiveRecord::Migration
  def change
    create_table :jobtypes do |t|
      t.string :name

      t.timestamps null: false
    end
    change_column :jobtypes, :name, :string, null: false
    add_index :jobtypes, :name, unique: true
  end
end
