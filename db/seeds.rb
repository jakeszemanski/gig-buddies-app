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


  empty_bottle_doc = Nokogiri::HTML(open('http://www.emptybottle.com/full/'))

  empty_bottle_show_html = empty_bottle_doc.css('div.tw-plugin-full-event-list ul li div.show_full')
  empty_bottle_show_details = empty_bottle_show_html.map do |link|
    {
      date: link.css('span.show_details span.show_date span.tw-event-date-complete span.tw-event-date').text.strip,
      show: link.css('span.show_details span.show_date span.tw-event-time-complete span.tw-event-time').text.strip,
      artists: link.css('span.show_details span.show_artists ul li').children.map { |el| el.to_s.strip },
      picture: link.css('span.show_image img @src').text.strip,
      description: link.css('span.show_description p').text.strip
    }
  end
  
  empty_bottle = Venue.find_by(name: "Empty Bottle")
  empty_bottle_show_details.each do |show|
    if Concert.find_by(date: show[:date], show: show[:show], venue_id: empty_bottle.id) == nil
      concert = Concert.new(
        date: Date.parse(show[:date]).to_s,
        show: show[:show],
        venue_id: empty_bottle.id,
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

  thalia_hall = Venue.find_by(name: "Thalia Hall")
  thalia_hall_show_details.each do |show|
    if Concert.find_by(date: Date.parse(show[:date]).to_s, show: show[:show], venue_id: thalia_hall.id) == nil
      concert = Concert.new(
        date: Date.parse(show[:date]).to_s,
        show: show[:show],
        venue_id: thalia_hall.id,
        picture: show[:picture])
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

  beat_kitchen = Venue.find_by(name: "Beat Kitchen")
  beat_kitchen_show_details.each do |show|
    if Concert.find_by(date: Date.parse(show[:date]).to_s, show: show[:show], venue_id: beat_kitchen.id) == nil
      concert = Concert.new(
        date: Date.parse(show[:date]).to_s,
        doors: show[:doors],
        show: show[:show],
        venue_id: beat_kitchen.id,
        picture: show[:picture])
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

  the_hideout = Venue.find_by(name: "The Hideout")
  the_hideout_show_details.each do |show|
    if Concert.find_by(date: Date.parse(show[:date]).to_s, show: show[:show], venue_id: the_hideout.id) == nil  
      concert = Concert.new(
        date: Date.parse(show[:date]).to_s,
        doors: show[:doors],
        show: show[:show],
        venue_id: the_hideout.id,
        picture: show[:picture])
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

  the_metro_doc = Nokogiri::HTML(open('http://www.metrochicago.com/shows/'))

  the_metro_show_html = the_metro_doc.css('div.showContainer')
  the_metro_show_details = the_metro_show_html.map do |link|
    {
      date: link.css('h2.date a').text.strip,
      doors: link.css('h4.showinfo').text.strip.split("/")[2].sub(" Doors: ", ''),
      show: link.css('h4.showinfo').text.strip.split("/")[3].sub(" Show: ", ""),
      artists: link.css('div.headliner h1 h1, div.support h3 h3 strong').children.map { |el| el.to_s.strip },
      picture: link.css('img @src').text.strip,
      description: link.css('div.showsContent div.expandable p').text.strip,
      venue: link.css('div.picCTA').text.strip.split('/').to_s.downcase
    } 
  end

  the_metro_show_details.each do |show|
    if show[:venue].include?('riviera')
      venue = Venue.find_by(name: 'The Riveria') 
    elsif show[:venue].include?('vic theatre')
      venue = Venue.find_by(name: 'Vic Theatre')
    else
      venue = Venue.find_by(name: "The Metro")
    end
    
    if Concert.find_by(date: Date.parse(show[:date]).to_s, show: show[:show], venue_id: venue.id) == nil
      concert = Concert.new(
        date: Date.parse(show[:date]).to_s,
        doors: show[:doors],
        show: show[:show],
        picture: show[:picture],
        description: show[:description],
        venue_id: venue.id)
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

  lincoln_hall_doc = Nokogiri::HTML(open('http://do312.com/venues/lincoln-hall'))

  lincoln_hall_show_html = lincoln_hall_doc.css('div.ds-listings-groups div.ds-events-group')
  lincoln_hall_show_details = lincoln_hall_show_html.map do |link|
    { 
      show: link.css('div.ds-event-time').text.strip,
      date: link.css('span.ds-list-break-date').text.strip,
      artists: link.css('span.ds-listing-event-title-text').text.strip.split(",")
    } 
  end

  lincoln_hall = Venue.find_by(name: "Lincoln Hall")
  lincoln_hall_show_details.each do |show|
    if Concert.find_by(date: Date.parse(show[:date]).to_s, show: show[:show], venue_id: lincoln_hall.id) == nil  
      concert = Concert.new(
        date: Date.parse(show[:date]).to_s,
        show: show[:show],
        venue_id: lincoln_hall.id)
        
      if show[:artists][0] && show[:artists][0] != ''
        @spotify = Unirest.get("https://api.spotify.com/v1/search",
            parameters: {
              q: show[:artists][0],
              type: "artist"}).body
      end
      if @spotify != nil
        concert.picture = 'assets/img/gig_buddies_logo_1.png'
      else
        concert.picture = @spotify['artists']['items'][0]['images'][0]['url']
      end
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

  schubas_doc = Nokogiri::HTML(open('http://www.do312.com/venues/schubas/'))

  schubas_show_html = schubas_doc.css('div.ds-events-group')
  schubas_show_details = schubas_show_html.map do |link|
    {
      date: link.css('span.ds-list-break-date').text.strip,
      show: link.css('div.ds-event-time').text.strip,
      artists: link.css('span.ds-listing-event-title-text').text.strip.split(", ")
    } 
  end

  schubas = Venue.find_by(name: "Schubas")
  schubas_show_details.each do |show|
    if Concert.find_by(date: Date.parse(show[:date]).to_s, show: show[:show], venue_id: schubas.id) == nil  
      concert = Concert.new(
        date: Date.parse(show[:date]).to_s,
        show: show[:show],
        venue_id: schubas.id)
        
      if show[:artists][0] && show[:artists][0] != ''
        @spotify = Unirest.get("https://api.spotify.com/v1/search",
            parameters: {
              q: show[:artists][0],
              type: "artist"}).body
      end
      if show[:artists][0] && show[:artists][0] != ''
        @spotify = Unirest.get("https://api.spotify.com/v1/search",
            parameters: {
              q: show[:artists][0],
              type: "artist"}).body
      end
      if @spotify != nil
        concert.picture = 'assets/img/gig_buddies_logo_1.png'
      else
        concert.picture = @spotify['artists']['items'][0]['images'][0]['url']
      end
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



puts 'done!'