require 'open-uri'


venue_images = {"Thalia Hall" => 'thalia_1.jpg', "Schubas" => 'schubas_1.jpg', "Empty Bottle" => 'empty_bottle_1.jpg', "Double Door" => 'double_door_1.jpg', "Lincoln Hall" => 'lincoln_hall_1.jpg', "House of Blues" => 'house_of_blues_1.jpg'}

names = ['Joe', 'Sam', 'Bobby', 'Trevor', 'Jake', 'John', 'Steve', 'Ryan', 'Isaac']
prof_pics = {'Joe' => 'prof1.jpg', 'Sam' => 'prof2.jpg', 'Bobby' => 'prof3.jpg', 'Trevor' => 'prof4.png', 'Jake' => 'prof5.png', 'John' => 'prof6.png', 'Steve' => 'prof7.png', 'Isaac' => 'prof8.jpg', 'Ryan' => 'prof9.jpg'}

names.each do |name|
  user = User.new(name: name, email: "#{name}@gmail.com", profile_pic: prof_pics[name], password: 'password' )
  user.save
end
@users = User.all







sites = ['Schubas', 'Lincoln Hall', 'Thalia Hall', 'Empty Bottle', 'Double Door', 'House of Blues']
will_call = ['show copy of Ticket holders ID at door', 'ticket holder must be present at door to transfer', 'no verification required', 'show ID and the last 4 digits of credit card used to purchased', 'Original ticket holder must call venue and give them name of the new party picking up the ticket']
sites.each do |site|
  venue = Venue.new(
    name: site,
    will_call_policy: will_call.sample.to_s,
    address: 'Chicago',
    image: venue_images[site]
    )
  venue.save
end
@venues = Venue.all







rev = [
  "Sound was perfect but the sight lines were not great",
  "Horrible sound but at least the drinks were cheap",
  "Blown away, definitely my favorite venue in the city",
  "Love this place! Come here every week!!!",
  "Meh, things are cooler in Brooklyn"
]


rating = [3, 5, 4, 2, 4, 5, 1, 3]
@venues.each do |venue|
  12.times do
    review = Review.new(
      rating: rating.sample,
      description: rev.sample,
      venue_id: venue.id,
      user_id: @users.sample.id
      )
    review.save
  end
end
@reviews = Review.all




doc = Nokogiri::HTML(open('http://www.emptybottle.com/full/'))

show_html = doc.css('div.tw-plugin-full-event-list ul li div.show_full span.show_details')
show_details = show_html.map do |link|
  {
    date: link.css('span.show_date span.tw-event-date-complete span.tw-event-date').text.strip,
    time: link.css('span.show_date span.tw-event-time-complete span.tw-event-time').text.strip,
    artists: link.css('span.show_artists ul li').children.map { |el| el.to_s.strip }
  }
end


show_details.each do |show|
  concert = Concert.new(
    date: Date.parse(show[:date]).to_s,
    show: show[:time],
    bands: show[:artists],
    venue_id: Venue.find_by(name: "Empty Bottle").id)
  concert.save
end
@concerts = Concert.all

compensate = ['a beer', 'free!', 'ticket to another show', 'Venmo me $5', 'A ride to the show', 'future considerations', 'Venmo $30', '$15 or best offer', 'offer something', 'A show poster', 'some merch']
status = ['available', 'unavailable']
compensate.each do |comp|
  tix = Ticket.new(
    status: 'available',
    seller_id: @users.sample.id,
    concert_id: @concerts.sample.id,
    buyer_id: @users.sample.id,
    compensation: comp
    )
  tix.save
end
@tickets = Ticket.all




puts 'done!'