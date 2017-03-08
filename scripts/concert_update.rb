
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
  
  empty_bottle = Venue.find_by(name: "Empty Bottle")
  empty_bottle_show_details.each do |show|
    show.bands[0]
    if Concert.find_by(date: show[:date], time: show[:time], venue_id: empty_bottle.id) == nil
      concert = Concert.new(
        date: Date.parse(show[:date]).to_s,
        show: show[:time],
        venue_id: Venue.find_by(name: "Empty Bottle").id,
        picture: show[:picture],
        description: show[:description])
      concert.save
      
      if show[:artists].is_a?(String)
        if Band.find_by(name: show[:artists]) == nil
          new_band = Band.new(name: show[:artists])
          new_band.save
          bc = BandConcert.new(
              band_id: new_band.id,
              concert_id: concert.id)
          bc.save
        else
          existing_band = Band.find_by(name: show[:artists])
          bc = BandConcert.new(
              band_id: existing_band.id,
              concert_id: concert.id)
          bc.save
        end
      else
        show[:artists].each do |band_name|
          if Band.find_by(name: band_name) == nil
            new_band = Band.new(name: band_name)
            new_band.save
            bc = BandConcert.new(
                band_id: new_band.id,
                concert_id: concert.id)
            bc.save
          else
            existing_band = Band.find_by(name: band_name)
            bc = BandConcert.new(
                band_id: existing_band.id,
                concert_id: concert.id)
            bc.save
          end
        end
      end
    end  
  end 
end


