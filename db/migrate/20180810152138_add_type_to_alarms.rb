class AddTypeToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :alarm_type, :integer
  end
end
