class AddProblemRefToOthers < ActiveRecord::Migration[5.2]
  def change
    add_reference :others, :problem, foreign_key: true
  end
end
