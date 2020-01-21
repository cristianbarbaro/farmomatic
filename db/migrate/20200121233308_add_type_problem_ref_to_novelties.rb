class AddTypeProblemRefToNovelties < ActiveRecord::Migration[5.2]
  def change
    add_reference :novelties, :type_problem, foreign_key: true
  end
end
