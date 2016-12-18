class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @review = Review.new(
      rating: params[:rating],
      description: params[:description],
      user_id: current_user.id
      )
    @review.save
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
