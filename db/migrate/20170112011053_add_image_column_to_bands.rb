class AddImageColumnToBands < ActiveRecord::Migration[5.0]
  def change
    add_column :bands, :image, :string
  end
end
