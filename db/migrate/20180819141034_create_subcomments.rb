class CreateSubcomments < ActiveRecord::Migration
  def change
    create_table :subcomments do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
