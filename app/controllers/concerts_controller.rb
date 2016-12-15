class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all
    render 'index.html.erb'
  end
  
  def show
    @concert = Concert.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    flash[message] = "Concert created!"
    redirect_to "/concerts/:id"
  end

 

  def edit
    render 'edit.html.erb'
  end

  def update
    flash[message] = 'Concert updated!'
    redirect_to "/concerts/:id"
  end

  def delete

  end
end
