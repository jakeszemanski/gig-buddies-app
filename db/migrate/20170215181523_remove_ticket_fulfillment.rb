class RemoveTicketFulfillment < ActiveRecord::Migration[5.0]
  def change
    remove_column :tickets, :ticket_fulfilled, :boolean
  end
end
