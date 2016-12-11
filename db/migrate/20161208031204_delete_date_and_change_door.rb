class DeleteDateAndChangeDoor < ActiveRecord::Migration[5.0]
  def change
    rename_column :concerts, :door, :doors
    remove_column :concerts, :date, :date
  end
end
