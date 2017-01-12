
band_images = ["acoustic.jpg", "acoustic_1.jpg", "acoustic_2.jpg", "rock_1.jpg", "rock_2.jpg", "rock_3.jpg", "xenia_1.jpg", "xenia_2.jpg", "trumpet.jpg"]
venue_images = {"Thalia Hall" => 'thalia_1.jpg', "Schubas" => 'schubas_1.jpg', "Empty Bottle" => 'empty_bottle_1.jpg', "Double Door" => 'double_door_1.jpg', "Lincoln Hall" => 'lincoln_hall_1.jpg', "House of Blues" => 'house_of_blues_1.jpg'}

names = ['Joe', 'Sam', 'Bobby', 'Trevor', 'Jake', 'John', 'Steve']

names.each do |name|
  user = User.new(name: name, email: "#{name}@gmail.com", password: 'password' )
  user.save
end
@users = User.all



bands = ['Twin Peaks', 'Lady Lamb', 'Ode', 'Dawes', 'Meat Wave', 'Bleach Party', 'Dowsing', 'Delta Spirit', 'Speedy Ortiz', 'Modern Baseball', 'Local Natives', 'Arcade Fire', 'Free Throw', 'Diners', 'Cake', 'Built to Spill', 'Ben Folds', 'Andrew WK', 'AJJ', 'Tacocat']

bands.each do |band|
  artist = Band.new(
    name: band,
    image: band_images.sample)
  artist.save
end
@bands = Band.all

sites = ['Schubas', 'Lincoln Hall', 'Thalia Hall', 'Empty Bottle', 'Double Door', 'House of Blues']
will_call = ['strict', 'loose']
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

dates = ['2017-02-12', '2017-01-21', '2017-02-05', '2017-01-07', '2017-04-20', '2017-03-04', '2017-06-26']
doors = ["5:30pm", "6:00pm", "6:30pm", "7:00pm"]

times = ['7:00pm', "7:30pm", '8:00pm', "8:30pm", '9:00pm']
7.times do
  show = Concert.new(
    doors: doors.sample,
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
@venues.each do |venue|
  3.times do
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

@concerts.each do |concert|
  3.times do
    bc = BandConcert.new(
      concert_id: concert.id,
      band_id: @bands.sample.id)
    bc.save
  end
end

10.times do
  uc = UserConcert.new(
    user_id: @users.sample.id,
    concert_id: @concerts.sample.id)
  uc.save
end

puts 'done!'