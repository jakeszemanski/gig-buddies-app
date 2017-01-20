json.array! @concerts.each do |concert|
  json.id concert.id
  json.date concert.date
  json.doors concert.doors
  json.show concert.show
  json.venueId concert.venue_id
  json.bands concert.bands
  json.tickets concert.tickets
end