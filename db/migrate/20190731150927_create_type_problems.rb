class CreateTypeProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :type_problems do |t|
      t.string :name
      t.string :scientific_name
      t.string :url, null: true
      t.string :description, null: true

      t.timestamps
    end
  end
end
