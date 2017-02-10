class DropBandandBandConcertTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :bands 
    drop_table :band_concerts
    drop_table :user_bands
  end
end
