class AddPlantationRefToOthers < ActiveRecord::Migration[5.2]
  def change
    add_reference :others, :plantation, foreign_key: true
  end
end
