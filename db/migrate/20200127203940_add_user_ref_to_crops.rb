class AddUserRefToCrops < ActiveRecord::Migration[5.2]
  def change
    add_reference :crops, :user, foreign_key: true
  end
end
