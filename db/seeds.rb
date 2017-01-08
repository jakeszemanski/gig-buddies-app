


names = ['Joe', 'Sam', 'Bobby', 'Trevor', 'Jake', 'John', 'Steve']

names.each do |name|
  user = User.new(name: name, email: "#{name}@gmail.com", password: 'password' )
  user.save
end
@users = User.all



bands = ['Twin Peaks', 'Lady Lamb', 'Ode', 'Dawes', 'Meat Wave', 'Bleach Party', 'Dowsing', 'Delta Spirit', 'Speedy Ortiz', 'Modern Baseball', 'Local Natives', 'Arcade Fire', 'Free Throw', 'Diners', 'Cake', 'Built to Spill', 'Ben Folds', 'Andrew WK', 'AJJ', 'Tacocat']

bands.each do |band|
  artist = Band.new(name: band)
  artist.save
end
@bands = Band.all

sites = ['Schubas', 'Lincoln Hall', 'Thalia Hall', 'Empty Bottle', 'Double Door', 'House of Blues', ]
will_call = ['strict', 'loose']
sites.each do |site|
  venue = Venue.new(
    name: site,
    will_call_policy: will_call.sample.to_s,
    address: 'Chicago'
    )
  venue.save
end
@venues = Venue.all

dates = ['2017-02-12', '2017-01-21', '2017-02-05', '2017-01-07', '2017-04-20', '2017-03-04', '2017-06-26']
times = ["6:00pm", '7:00pm', '8:00pm', '9:00pm', '10:00pm']
7.times do
  show = Concert.new(
    doors: times.sample,
    show: times.sample,
    venue_id: @venues.sample.id,
    date: dates.sample 
    )
  show.save
end
@concerts = Concert.all



compensate = ['a beer', 'free!', 'ticket to another show', 'Venmo me $5', 'A ride to the show']
status = ['available', 'unavailable']
compensate.each do |comp|
  tix = Ticket.new(
    status: status.sample,
    seller_id: @users.sample.id,
    concert_id: @concerts.sample.id,
    buyer_id: @users.sample.id,
    compensation: comp
    )
  tix.save
end
@tickets = Ticket.all

rev = [
  "Sound was perfect but the sight lines were not great",
  "Horrible sound but at least the drinks were cheap",
  "Blown away, definitely my favorite venue in the city",
  "Love this place! Come here every week!!!",
  "Meh, things are cooler in Brooklyn"
]
rating = [3, 5, 4, 2, 4, 5, 1, 3]
rating.each do |rate|
  review = Review.new(
    rating: rate,
    description: rev.sample,
    venue_id: @venues.sample.id,
    user_id: @users.sample.id
    )
  review.save
end
@reviews = Review.all

10.times do 
  bc = BandConcert.new(
    band_id: @bands.sample.id,
    concert_id: @concerts.sample.id
    )
  bc.save
end

10.times do
  uc = UserConcert.new(
    user_id: @users.sample.id,
    concert_id: @concerts.sample.id)
  uc.save
end

puts 'done!'