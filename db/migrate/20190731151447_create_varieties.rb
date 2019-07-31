class CreateVarieties < ActiveRecord::Migration[5.2]
  def change
    create_table :varieties do |t|
      t.string :name, null: false
      t.string :scientificName, null: false
      t.string :url, null: true
      t.string :description, null: true

      t.timestamps
    end
  end
end
