json.array! @concerts.each do |concert|
  json.id concert.id
  json.date concert.date
  json.doors concert.doors
  json.show concert.show
  json.venueId concert.venue_id
  json.bands concert.bands
  json.tickets concert.tickets
  json.venue concert.venue
  json.friendlyDate concert.friendly_date
  json.onMyCalendar current_user.concerts.include? concert
  json.thisWeek concert.date < 7.days.from_now

end