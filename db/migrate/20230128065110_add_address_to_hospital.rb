class AddAddressToHospital < ActiveRecord::Migration[6.1]
  def change
    add_column :hospitals, :address, :string
  end
end
