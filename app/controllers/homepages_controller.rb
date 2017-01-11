class HomepagesController < ApplicationController
  def index
    @concerts = Concert.order("date").all
    @concert1 = @concerts.first
    @concert2 = @concerts.second
    @concert3 = @concerts.third
    @venues = Venue.all
    render 'index.html.erb'
  end

end
