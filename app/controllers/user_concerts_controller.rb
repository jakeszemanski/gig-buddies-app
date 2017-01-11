class UserConcertsController < ApplicationController
  def create
    @event = UserConcert.new(user_id: current_user.id, concert_id: params[:concert_id])
    @event.save
    redirect_to "/concerts?calendar=#{current_user.id}"
  end
end
