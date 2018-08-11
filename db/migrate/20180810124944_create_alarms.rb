class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :findable, index: true, pholymophic: true
      t.boolean :is_read
      t.integer :alarm_type

      t.timestamps null: false
    end
  end
end
