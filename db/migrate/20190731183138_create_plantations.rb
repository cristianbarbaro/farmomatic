class CreatePlantations < ActiveRecord::Migration[5.2]
  def change
    create_table :plantations do |t|
      t.string :comment
      t.float :amount
      t.references :plot, foreign_key: true
      t.references :species, foreign_key: true

      t.timestamps
    end
  end
end
