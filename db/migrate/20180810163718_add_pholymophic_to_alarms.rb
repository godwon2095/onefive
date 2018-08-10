class AddPholymophicToAlarms < ActiveRecord::Migration
  def change
    add_reference :alarms, :findable, index: true, foreign_key: true, pholymophic: true
  end
end
