class AddBandsToConcerts < ActiveRecord::Migration[5.0]
  def change
    add_column :concerts, :bands, :string
  end
end
