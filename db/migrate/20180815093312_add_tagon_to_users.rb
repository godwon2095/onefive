class AddTagonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tag_on, :boolean, default: true
  end
end
