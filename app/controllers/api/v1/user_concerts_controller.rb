class Api::V1::UserConcertsController < ApplicationController
   def index
    @user_concerts = UserConcert.all
    render 'index.json.jbuilder'
  end
end
