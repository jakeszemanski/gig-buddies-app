class ConcertsController < ApplicationController
  # def homepage
  #   @concerts = Concert.order("date").all
  #   @concert1 = @concerts.first
  #   @concert2 = @concerts.second
  #   @concert3 = @concerts.third
  #   @venues = Venue.all
  #   render 'homepage.html.erb'
  # end

  def index
    @concerts = Concert.order("date").all
    @concert1 = @concerts.first
    @concert2 = @concerts.second
    @concert3 = @concerts.third
    @venues = Venue.all
    render 'index.html.erb'
  end
  
  def show
    @concert = Concert.find_by(id: params[:id])
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
end
