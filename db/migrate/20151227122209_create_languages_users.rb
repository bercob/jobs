class CreateLanguagesUsers < ActiveRecord::Migration
  def change
    create_table :languages_users do |t|
      t.integer :user_id
      t.integer :language_id

      t.timestamps null: false
    end
    add_index :languages_users, ["user_id", "language_id"], :unique => true
  end
end
