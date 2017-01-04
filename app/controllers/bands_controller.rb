class BandsController < ApplicationController
  def index
    @bands = Band.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @band = Band.new(name: params[:band_name])
    @band.save
    redirect_to '/bands'
  end

  def show
    @band = Band.find_by(id: params[:id])
   # @concert = Concert.find_by(band_id: @band.id)
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @band = Band.find_by(id: params[:id])
    @band.name = params[:band_name]
    @band.save
    flash[:message] = 'Band successfully updated!'
    redirect_to '/bands'
  end

  def destroy
  
  end 


end
