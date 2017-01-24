class AddBandIdandUserIdToUserBands < ActiveRecord::Migration[5.0]
  def change
    add_column :user_bands, :user_id, :string
    add_column :user_bands, :band_id, :string
  end
end
