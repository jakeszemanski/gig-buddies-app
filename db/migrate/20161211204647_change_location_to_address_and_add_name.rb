class ChangeLocationToAddressAndAddName < ActiveRecord::Migration[5.0]
  def change
    rename_column :venues, :location, :name 
    add_column :venues, :address, :string
  end
end
