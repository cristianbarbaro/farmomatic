class CreatePlots < ActiveRecord::Migration[5.2]
  def change
    create_table :plots do |t|
      t.string :identifier
      t.text :description
      t.string :surface
      t.boolean :greenhouse
      
      t.belongs_to :farm, index: true, null: false

      t.timestamps
    end
  end
end
