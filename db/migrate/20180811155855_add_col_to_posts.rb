class AddColToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :song_ids, :string
  end
end
