class Api::V1::ReviewsController < ApplicationController
  def create
    @review = Review.new(
          user_id: params[:user_id],
          description: params[:description],
          venue_id: params[:venue_id],
          rating: params[:rating]
          )
    @review.save
  end
end
