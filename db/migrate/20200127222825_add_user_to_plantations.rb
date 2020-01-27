class AddUserToPlantations < ActiveRecord::Migration[5.2]
  def change
    add_reference :plantations, :user, foreign_key: true
  end
end
