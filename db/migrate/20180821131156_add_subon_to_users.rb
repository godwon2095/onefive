class AddSubonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subcomment_on, :boolean, default: true
  end
end
