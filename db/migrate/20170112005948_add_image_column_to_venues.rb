class AddImageColumnToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :image, :string
  end
end
