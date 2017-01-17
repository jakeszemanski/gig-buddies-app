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
    @headliner = @concert.bands.first.name
    @spotify = Unirest.get("https://api.spotify.com/v1/search",
      parameters: {
        q: @headliner,
        type: "artist"}).body
    @genres = @spotify['artists']['items'][0]['genres']
    @uri = @spotify['artists']['items'][0]['uri']

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
    @event = UserConcert.new(user_id: current_user.id, concert_id: params[concert_id])
  end

  def calendar
    @events = UserConcert.where(user_id: current_user.id)
    render 'calendar.html.erb'
  end
end
