class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name

      t.timestamps null: false
    end
    change_column :languages, :name, :string, null: false
    add_index :languages, :name, unique: true
  end
end
