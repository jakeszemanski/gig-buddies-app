class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render 'index.html.erb'
  end

  def new
    @venues =  Venue.all
    render 'new.html.erb'
  end

  def create
    @review = Review.new(
      rating: params[:rating],
      description: params[:description],
      user_id: current_user.id,
      venue_id: params[:venue]
      )
    @review.save
    redirect_to "/reviews"
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def edit
    @review = Review.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @review = Review.find_by(id: params[:id])
    @review.rating = params[:rating]
    @review.description = params[:description]
    #maybe add @review.user_id = current_user/session.id
    @review.save
  end

  def destroy

  end
end
