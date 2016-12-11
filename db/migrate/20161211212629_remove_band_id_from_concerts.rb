class RemoveBandIdFromConcerts < ActiveRecord::Migration[5.0]
  def change
    remove_column :concerts, :band_id, :integer
  end
end
