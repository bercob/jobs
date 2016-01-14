class CreateLanguagesUsers < ActiveRecord::Migration
  def change
    create_table :languages_users, id: false do |t|
      t.integer :user_id, null: false
      t.integer :language_id, null: false
    end
    add_index :languages_users, %w(user_id language_id), unique: true
    add_foreign_key :languages_users, :user_id, on_delete: :cascade
    add_foreign_key :languages_users, :language_id, on_delete: :cascade
  end
end
