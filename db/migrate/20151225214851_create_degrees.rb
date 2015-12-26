class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :name

      t.timestamps null: false
    end
    change_column :degrees, :name, :string, null: false
    add_index :degrees, :name, unique: true
  end
end
