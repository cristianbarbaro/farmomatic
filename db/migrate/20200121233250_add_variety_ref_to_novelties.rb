class AddVarietyRefToNovelties < ActiveRecord::Migration[5.2]
  def change
    add_reference :novelties, :variety, foreign_key: true
  end
end
