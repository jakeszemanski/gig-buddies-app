class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :seller_id
      t.integer :concert_id
      t.integer :buyer_id
      t.string :compensation
      t.string :status, default: "available"

      t.timestamps
    end
  end
end
