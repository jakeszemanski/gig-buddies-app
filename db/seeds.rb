


names = ['Joe', 'Sam', 'Bobby', 'Trevor']

names.each do |name|
  user = User.new(name: name, email: "#{name}@gmail.com", password: 'password' )
  user.save
end
@users = User.all



bands = ['Twin Peaks', 'Lady Lamb', 'Ode', 'Dawes']

bands.each do |band|
  artist = Band.new(name: band)
  artist.save
end
@bands = Band.all

sites = ['Schubas', 'Lincoln Hall', 'Thalia Hall', 'Empty Bottle']
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

dates = ['2017-02-12', '2017-01-21', '2017-02-05', '2017-01-07']
times = ["6:00pm", '7:00pm', '8:00pm', '9:00pm', '10:00pm']
3.times do
  show = Concert.new(
    doors: times.sample,
    show: times.sample,
    venue_id: @venues.sample.id,
    date: dates.sample 
    )
  show.save
end
@concerts = Concert.all



compensate = ['a beer', 'a hug', 'a drug']
status = ['availabe', 'unavailable']
compensate.each do |comp|
  tix = Ticket.new(
    seller_id: @users.sample.id,
    concert_id: @concerts.sample.id,
    buyer_id: @users.sample.id,
    compensation: comp,
    status: status.sample
    )
  tix.save
end
@tickets = Ticket.all

rating = [7, 10, 4, 2]
rating.each do |rate|
  review = Review.new(
    rating: rate,
    description: 'blah blah blah blah',
    venue_id: @venues.sample.id,
    user_id: @users.sample.id
    )
  review.save
end
@reviews = Review.all

5.times do 
  bc = BandConcert.new(
    band_id: @bands.sample.id,
    concert_id: @concerts.sample.id
    )
  bc.save
end

puts 'done!'