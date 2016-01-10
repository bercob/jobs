class CreateOffercategories < ActiveRecord::Migration
  def change
    create_table :offercategories do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :offercategories, :name, unique: true
  end
end
