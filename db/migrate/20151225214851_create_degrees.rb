class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :degrees, :name, unique: true
  end
end
