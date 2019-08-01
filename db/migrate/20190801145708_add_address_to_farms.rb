class AddAddressToFarms < ActiveRecord::Migration[5.2]
  def change
    add_column :farms, :address, :string
  end
end
