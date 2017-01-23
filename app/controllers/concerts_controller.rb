class ConcertsController < ApplicationController
  # require 'google/apis/calendar_v3'
  # require 'bandsintown'
 
  def index
  # Bandsintown.app_id = 'gig_buddies'
    # Bandsintown.app_id = 'YOUR_APP_ID'
    # artist = Bandsintown::Artist.new({
    #   :name => "The Killers"
    # })
    # @events = artist.events
    @bands = Band.all
    @bands.each do |band|
      new_image = Unirest.get("https://api.spotify.com/v1/search",
             parameters: {
               q: band.name,
               type: "artist"}).body
      band.update(image: new_image['artists']['items'][0]['images'][0]['url'])
    end



    if params[:calendar]
      @concerts = current_user.concerts.order("date")
    elsif params[:venue_id]
      @concerts = Concert.where(venue_id: params[:venue_id]).order("date")
    else  
      @concerts = Concert.order("date").all
      @venues = Venue.all
    end

    render 'index.html.erb'
  end
  
  def show
    @concert = Concert.find_by(id: params[:id])
    @headliner = @concert.bands.first.name
    @spotify = Unirest.get("https://api.spotify.com/v1/search",
      parameters: {
        q: @headliner,
        type: "artist"}).body
    @genres = @spotify['artists']['items'][0]['genres']
    @uri = @spotify['artists']['items'][0]['uri']
    @weather_date = @concert.date.strftime("%e %b %Y")
    @weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22chicago%2C%20il%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    @high= @weather['query']["results"]['channel']['item']['forecast'].find { |h| h['date'] == '24 Jan 2017' }['high']
    @text = @weather['query']["results"]['channel']['item']['forecast'].find { |h| h['date'] == '24 Jan 2017' }['text']

    render 'show.html.erb'
  end

  def new
    @concert = Concert.new
    render 'new.html.erb'
  end

  def create
    # concert = Concert.new(
    #   venue_id: Venue.find_by(name: params[:venue_name]),
    #   doors: params[:doors],
    #   show: params[:show],
    #   date: params[:date],
    # )
    # if concert.save
    #   BandConcert.create(band_id: params[:band_ids][:first_band], concert_id: concert.id)
    #   BandConcert.create(band_id: params[:band_ids][:first_band], concert_id: concert.id)
    #   BandConcert.create(band_id: params[:band_ids][:first_band], concert_id: concert.id)
    #   flash[message] = "Concert created!"
    #   redirect_to "/concerts/:id"
    # else
    #   render 'new.html.erb'
    # end
    redirect_to "/concerts/new"
  end

 

  def edit
    @concert = Concert.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    flash[:message] = 'Concert updated!'
    redirect_to "/concerts/:id"
  end
  
  
  def delete
    @concert = Concert.find_by(id: params[:id])
    @concert.destroy
  end


  def add_to_calendar
    add_to_google_calendar
    @event = UserConcert.new(user_id: current_user.id, concert_id: params[concert_id])
  end

  def calendar
    @events = UserConcert.where(user_id: current_user.id)
    render 'calendar.html.erb'
  end


    private

      def add_to_google_calendar
        event = Google::Apis::CalendarV3::Event.new(
        summary: 'Google I/O 2015',
        location: '800 Howard St., San Francisco, CA 94103',
        description: 'A chance to hear more about Googles developer products.',
        start: {
          date_time: '2017-01-28T09:00:00-07:00',
          time_zone: 'America/Los_Angeles',
        },
        end: {
          date_time: '2015-05-28T17:00:00-07:00',
          time_zone: 'America/Los_Angeles',
        },
      )
       result = client.insert_event('primary', event)
       puts "Event created: #{result.html_link}"
     end
end
