class AddUserRefToProductApplications < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_applications, :user, foreign_key: true
  end
end
