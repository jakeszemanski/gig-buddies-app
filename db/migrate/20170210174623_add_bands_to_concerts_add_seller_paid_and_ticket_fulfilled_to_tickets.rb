class AddBandsToConcertsAddSellerPaidAndTicketFulfilledToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :concerts, :bands, :string, array: true, default: []
    add_column :tickets, :seller_paid, :boolean, default: false
    add_column :tickets, :ticket_fulfilled, :boolean, default: false
  end
end
