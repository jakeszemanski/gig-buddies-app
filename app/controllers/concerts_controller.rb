class ConcertsController < ApplicationController
  def index
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
    @ticket_count = Ticket.where(concert_id: @concert.id, status: 'available').count
    @headliner = @concert.bands.first.name
   
    @weather_date = @concert.date.strftime("%e %b %Y")
    @weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22chicago%2C%20il%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    if @weather['query']['results']
      if @weather['query']['results']['channel']['item']['forecast'].find { |h| h['date'] == @weather_date }
        @high= @weather['query']["results"]['channel']['item']['forecast'].find { |h| h['date'] == @weather_date }['high']
        @text = @weather['query']["results"]['channel']['item']['forecast'].find { |h| h['date'] == @weather_date }['text']
      end
    end

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
end
