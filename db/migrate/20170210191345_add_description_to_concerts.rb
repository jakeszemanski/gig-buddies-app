class AddDescriptionToConcerts < ActiveRecord::Migration[5.0]
  def change
    add_column :concerts, :description, :text
  end
end
