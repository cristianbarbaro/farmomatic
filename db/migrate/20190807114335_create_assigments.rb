class CreateAssigments < ActiveRecord::Migration[5.2]
  def change
    create_table :assigments do |t|
      t.references :user, foreign_key: true
      t.references :farm, foreign_key: true

      t.timestamps
    end
  end
end
