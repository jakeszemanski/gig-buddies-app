class ChangeIdToInteger < ActiveRecord::Migration[5.0]
  def change
   remove_column :band_concerts, :band_id, :string
   remove_column :band_concerts, :concert_id, :string
  end
end
