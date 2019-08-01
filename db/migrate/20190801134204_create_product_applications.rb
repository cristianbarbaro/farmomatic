class CreateProductApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :product_applications do |t|
      t.string :comment
      t.float :amount
      t.references :product, foreign_key: true
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
