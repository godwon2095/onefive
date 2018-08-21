class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :identity, :string
    add_index :users, :identity, unique: true
    add_column :users, :name, :string
    add_index :users, :name, unique: true
  end
end
