class AddCheckToComments < ActiveRecord::Migration
  def change
    add_column :comments, :is_first?, :boolean, default: true
  end
end
