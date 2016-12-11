class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :location
      t.string :will_call_policy

      t.timestamps
    end
  end
end
