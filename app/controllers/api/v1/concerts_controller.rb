class Api::V1::ConcertsController < ApplicationController
   def index
    @concerts = Concert.all
    render 'index.json.jbuilder'
  end
end
