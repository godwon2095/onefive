class AddColToUsers < ActiveRecord::Migration
  def change
    add_column :users, :comment_on, :boolean, default: true
    add_column :users, :follow_on, :boolean, default: true
    add_column :users, :like_on, :boolean, default: true
  end
end
