json.array! @user_concerts.each do |user_concert|
  json.id user_concert.id
  json.userId user_concert.user_id
  json.concertId user_concert.concert_id
  
end