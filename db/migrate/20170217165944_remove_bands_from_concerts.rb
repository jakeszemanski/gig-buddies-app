class RemoveBandsFromConcerts < ActiveRecord::Migration[5.0]
  def change
    remove_column :concerts, :bands, :string
  end
end
