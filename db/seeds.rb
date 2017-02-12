require 'open-uri'


venue_images = {"Thalia Hall" => 'thalia_1.jpg', "Schubas" => 'schubas_1.jpg', "Empty Bottle" => 'empty_bottle_1.jpg', "Double Door" => 'double_door_1.jpg', "Lincoln Hall" => 'lincoln_hall_1.jpg', "House of Blues" => 'house_of_blues_1.jpg', 'Beat Kitchen' => 'beat_kitchen_1.jpg', 'The Hideout' => 'the_hideout_1.jpg', 'The Metro' => 'the_metro_1.jpg'}

names = ['Joe', 'Sam', 'Bobby', 'Trevor', 'Jake', 'John', 'Steve', 'Ryan', 'Isaac']
prof_pics = {'Joe' => 'prof1.jpg', 'Sam' => 'prof2.jpg', 'Bobby' => 'prof3.jpg', 'Trevor' => 'prof4.png', 'Jake' => 'prof5.png', 'John' => 'prof6.png', 'Steve' => 'prof7.png', 'Isaac' => 'prof8.jpg', 'Ryan' => 'prof9.jpg'}

names.each do |name|
  user = User.new(name: name, email: "#{name}@gmail.com", profile_pic: prof_pics[name], password: 'password' )
  user.save
end
@users = User.all







sites = ['Schubas', 'Lincoln Hall', 'Thalia Hall', 'Empty Bottle', 'Double Door', 'House of Blues', 'Beat Kitchen', 'The Hideout', 'The Metro']
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

thalia_hall_doc = Nokogiri::HTML(open('http://www.thaliahallchicago.com/#!/'))

thalia_hall_show_html = thalia_hall_doc.css('div.event-list-item div.event-list-item-inner')
thalia_hall_show_details = thalia_hall_show_html.map do |link|
  {
    date: link.css('span.tw-event-date').text.strip,
    show: link.css('span.tw-event-time').text.strip,
    artists: link.css('div.tw-event-name').text.strip,
    picture: link.css('div.tw-event-image img @src').text.strip
  } 
end

thalia_hall_show_details.each do |show|
  artist = []
  artist << show[:artists]
  concert = Concert.new(
    date: Date.parse(show[:date]).to_s,
    show: show[:show],
    bands: artist,
    venue_id: Venue.find_by(name: "Thalia Hall").id,
    picture: show[:picture])
  concert.save
end


empty_bottle_doc = Nokogiri::HTML(open('http://www.emptybottle.com/full/'))

empty_bottle_show_html = empty_bottle_doc.css('div.tw-plugin-full-event-list ul li div.show_full')
empty_bottle_show_details = empty_bottle_show_html.map do |link|
  {
    date: link.css('span.show_details span.show_date span.tw-event-date-complete span.tw-event-date').text.strip,
    time: link.css('span.show_details span.show_date span.tw-event-time-complete span.tw-event-time').text.strip,
    artists: link.css('span.show_details span.show_artists ul li').children.map { |el| el.to_s.strip },
    picture: link.css('span.show_image img @src').text.strip,
    description: link.css('span.show_description p').text.strip
  }
end

empty_bottle_show_details.each do |show|
  concert = Concert.new(
    date: Date.parse(show[:date]).to_s,
    show: show[:time],
    bands: show[:artists],
    venue_id: Venue.find_by(name: "Empty Bottle").id,
    picture: show[:picture],
    description: show[:description])
  concert.save
end

beat_kitchen_doc = Nokogiri::HTML(open('http://www.beatkitchen.com/'))

beat_kitchen_html = beat_kitchen_doc.css('div#event-listing div.list-view-item')
beat_kitchen_show_details = beat_kitchen_html.map do |link|
  {
    date: link.css('div.list-view-details h2.dates').text.strip,
    artists: link.css('div.list-view-details h1.headliners a, h2.supports a').children.map { |el| el.to_s.strip },
    doors: link.css('div.list-view-details h2.times span.doors').text.strip.sub("Doors: ", ''),
    show: link.css('div.list-view-details h2.times span.start').text.strip.sub("Show: ", ''),
    picture: link.css('img @src').text.strip
  }
end

beat_kitchen_show_details.each do |show|
  concert = Concert.new(
    date: Date.parse(show[:date]).to_s,
    doors: show[:doors],
    show: show[:show],
    bands: show[:artists],
    venue_id: Venue.find_by(name: "Beat Kitchen").id,
    picture: show[:picture])
  concert.save
end

the_hideout_doc = Nokogiri::HTML(open('http://www.hideoutchicago.com'))

the_hideout_show_html = the_hideout_doc.css('div.list-view-item')
the_hideout_show_details = the_hideout_show_html.map do |link|
  {
    date: link.css('div.list-view-details h2.dates').text.strip,
    doors: link.css('div.list-view-details h2.times span.doors').text.strip.sub("Doors: ", ''),
    show: link.css('div.list-view-details h2.times span.start').text.strip.sub("Show: ", ''),
    artists: link.css('div.list-view-details h1.headliners a, h2.supports a').children.map { |el| el.to_s.strip },
    picture: link.css('img @src').text.strip
  } 
end

the_hideout_show_details.each do |show|
  concert = Concert.new(
    date: Date.parse(show[:date]).to_s,
    show: show[:show],
    bands: show[:artists],
    venue_id: Venue.find_by(name: "The Hideout").id,
    picture: show[:picture])
  concert.save
end

the_metro_doc = Nokogiri::HTML(open('http://www.metrochicago.com/shows/'))

the_metro_show_html = the_metro_doc.css('div.showContainer')
the_metro_show_details = the_metro_show_html.map do |link|
  {
    date: link.css('h2.date a').text.strip,
    doors: link.css('h4.showinfo').text.strip.split("/")[2].sub(" Doors: ", ''),
    show: link.css('h4.showinfo').text.strip.split("/")[3].sub(" Show: ", ""),
    artists: link.css('div.headliner h1 h1, div.support h3 h3 strong').children.map { |el| el.to_s.strip },
    picture: link.css('img @src').text.strip,
    description: link.css('div.showsContent div.expandable p').text.strip
  } 
end

the_metro_show_details.each do |show|
  concert = Concert.new(
    date: Date.parse(show[:date]).to_s,
    doors: show[:doors],
    show: show[:show],
    bands: show[:artists],
    venue_id: Venue.find_by(name: "The Metro").id,
    picture: show[:picture],
    description: show[:description])
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