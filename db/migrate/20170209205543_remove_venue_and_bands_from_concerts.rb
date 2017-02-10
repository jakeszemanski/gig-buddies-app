class RemoveVenueAndBandsFromConcerts < ActiveRecord::Migration[5.0]
  def change
    remove_column :concerts, :venue, :string
    remove_column :concerts, :bands, :string
  end
end
