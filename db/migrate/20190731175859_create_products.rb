class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :composition
      t.string :description, null: true

      t.timestamps
    end
  end
end
