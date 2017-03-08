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

  def friendly_payment_status
    if seller_paid == true
      return 'Payment Recieved'
    else
      return 'Awaiting Payment'
    end
  end
  def self.send_message(phone_number, alert_message)
    @client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV['TWILIO_AUTH_TOKEN'] 
    @twilio_number = ENV['TWILIO_NUMBER']
    message = @client.messages.create(
      :from => "+1#{@twilio_number}",
      :to => "+1#{phone_number}",
      :body => alert_message
    )
    puts message.to
  end
end
