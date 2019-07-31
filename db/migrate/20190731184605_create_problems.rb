class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.string :comment
      t.references :type_problem, foreign_key: true
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
