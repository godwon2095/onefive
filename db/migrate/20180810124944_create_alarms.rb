class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.boolean :is_read

      t.timestamps null: false
    end
  end
end
