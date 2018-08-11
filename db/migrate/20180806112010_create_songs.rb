class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :image
      t.references :singer, index: true, foreign_key: true
      t.string :album

      t.timestamps null: false
    end
    add_index :songs, :title
    add_index :songs, :image
    add_index :songs, :album
    add_index :songs, [:title, :singer_id, :album, :image], unique: true
  end
end
