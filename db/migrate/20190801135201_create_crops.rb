class CreateCrops < ActiveRecord::Migration[5.2]
  def change
    create_table :crops do |t|
      t.string :comment, null: true
      t.float :amount
      t.references :plot, foreign_key: true
      t.references :variety, foreign_key: true

      t.timestamps
    end
  end
end
