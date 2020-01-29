class AddProductApplicationRefToOthers < ActiveRecord::Migration[5.2]
  def change
    add_reference :others, :product_application, foreign_key: true
  end
end
