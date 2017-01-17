class VenuesController < ApplicationController
  def index
    @venues = Venue.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @venue = Venue.new(
      name: params[:rating],
      description: params[:description],
      user_id: current_user.id
      )
    @venue.save
  end

  def show
    @venue = Venue.find_by(id: params[:id])
    @concerts = Concert.where(venue_id: @venue.id).order('date')
  end

  def edit
    @venue = Venue.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @venue = venue.find_by(id: params[:id])
    @venue.rating = params[:rating]
    @venue.description = params[:description]
    #maybe add @venue.user_id = current_user/session.id
    @venue.save
  end

  def destroy

  end
end
