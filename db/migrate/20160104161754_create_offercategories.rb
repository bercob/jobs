class CreateOffercategories < ActiveRecord::Migration
  def change
    create_table :offercategories do |t|
      t.string :name

      t.timestamps null: false
    end
    change_column :offercategories, :name, :string, null: false
    add_index :offercategories, :name, unique: true
  end
end
