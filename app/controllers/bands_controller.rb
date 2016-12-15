class BandsController < ApplicationController
  def index
    @bands = Band.all
    render 'index.html.erb'
  end
  
end
