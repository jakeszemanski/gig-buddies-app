venue_images = {"Thalia Hall" => 'thalia_1.jpg', "Schubas" => 'schubas_1.jpg', "Empty Bottle" => 'empty_bottle_1.jpg', "Double Door" => 'double_door_1.jpg', "Lincoln Hall" => 'lincoln_hall_1.jpg', "House of Blues" => 'house_of_blues_1.jpg', 'Beat Kitchen' => 'beat_kitchen_1.jpg', 'The Hideout' => 'the_hideout_1.jpg', 'The Metro' => 'the_metro_1.jpg', 'Vic Theatre' => 'the_vic_1.jpg', 'Aragon Ballroom' => 'aragon_1.jpg','The Riveria' => 'riviera_1.jpg'}

sites = ['Schubas', 'Lincoln Hall', 'Thalia Hall', 'Empty Bottle', 'House of Blues', 'Beat Kitchen', 'The Hideout', 'The Metro', 'Vic Theatre', 'Aragon Ballroom', 'The Riveria']

will_call = {
  "Lincoln Hall" => "the only way you can make a ticket transfer is to have your friend or friends show up at the doors on the night of the show with your email confirmation and an original/physical state issued form of the ticket buyers ID. No photocopies of the forms of ID will be accepted. They must be the original copies. If these guidelines cannot be followed, no transfer will be allowed. Acceptable forms of ID include drivers license, state ID, or passport.",
  "Schubas" => "the only way you can make a ticket transfer is to have your friend or friends show up at the doors on the night of the show with your email confirmation and an original/physical state issued form of the ticket buyers ID. No photocopies of the forms of ID will be accepted. They must be the original copies. If these guidelines cannot be followed, no transfer will be allowed. Acceptable forms of ID include drivers license, state ID, or passport.",
  "Thalia Hall" => "Please contact TicketWeb to change the name on your order at 866-468-3401.",
  "Beat Kitchen" => "show copy of Ticket holders ID at door.",
  "Aragon Ballroom" => "Tickets held at Will Call can only be retrieved by the cardholder with original credit card of purchase and a valid photo ID with signature such as a state ID, driver's license or passport.",
  "House of Blues" => "If you bought your tickets through Live Nation or Ticketmaster, you can pick up those tickets at the Box Office any time its open (10AM – 5PM). You will need a valid photo ID and the credit card used for purchase.",
  "The Metro" => "show Ticket holders ID at box office inside of doors. They will give you a physical ticket that you can give to anyone you choose to.",
  "The Hideout" => "show copy of Ticket holders ID at door.",
  "Vic Theatre" => "Pick up at box office. You will need a valid photo ID and the credit card used for purchase.",
  "The Riveria" => "Pick up at box office. You will need a valid photo ID and the credit card used for purchase.",
  "Empty Bottle" => "show copy of Ticket holders ID at door."
}


sites.each do |site|
  venue = Venue.new(
    name: site,
    will_call_policy: will_call[site],
    address: 'Chicago',
    image: venue_images[site]
    )
  venue.save
end

puts 'done!'