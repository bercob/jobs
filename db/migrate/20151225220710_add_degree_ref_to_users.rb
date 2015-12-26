class AddDegreeRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :degree, index: true, foreign_key: true
  end
end
