class RemoveColsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :identity, :string
    remove_column :users, :name, :string
  end
end
