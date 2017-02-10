class AddPictureToConcerts < ActiveRecord::Migration[5.0]
  def change
    add_column :concerts, :picture, :string
  end
end
