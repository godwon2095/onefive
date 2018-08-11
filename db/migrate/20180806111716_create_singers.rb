class CreateSingers < ActiveRecord::Migration
  def change
    create_table :singers do |t|
      t.string :name
      t.string :company
      t.integer :uid

      t.timestamps null: false
    end
    add_index :singers, :name
    add_index :singers, :company
    add_index :singers, [:name, :company, :uid], unique: true
  end
end
