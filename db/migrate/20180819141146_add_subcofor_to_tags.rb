class AddSubcoforToTags < ActiveRecord::Migration
  def change
    add_reference :tags, :subcomment, index: true, foreign_key: true
  end
end
