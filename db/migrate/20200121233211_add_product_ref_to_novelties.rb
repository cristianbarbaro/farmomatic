class AddProductRefToNovelties < ActiveRecord::Migration[5.2]
  def change
    add_reference :novelties, :product, foreign_key: true
  end
end
