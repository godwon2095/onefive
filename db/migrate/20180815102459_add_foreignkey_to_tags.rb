class AddForeignkeyToTags < ActiveRecord::Migration
  def change
    add_reference :tags, :comment, index: true, foreign_key: true
  end
end
