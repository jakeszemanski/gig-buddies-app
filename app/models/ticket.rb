class Ticket < ApplicationRecord
  belongs_to :seller, class_name: :User, foreign_key: :seller_id
  belongs_to :buyer, class_name: :User, foreign_key: :buyer_id
  belongs_to :concert

  def toggle_ticket_fullfillment 
    if ticket_fulfilled == true
      ticket_fulfilled = false
    else
      ticket_fulfilled = true
    end
  end
end
