class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :subtitle
      t.text :content
      t.belongs_to :user
      t.integer :view_count, default: 0

      t.timestamps null: false
    end
  end
end
