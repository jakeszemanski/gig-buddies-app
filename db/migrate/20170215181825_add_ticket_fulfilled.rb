class AddTicketFulfilled < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :ticket_fulfilled, :string, :default => 'Pending'
  end
end
