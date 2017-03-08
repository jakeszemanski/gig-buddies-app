class TicketsController < ApplicationController
  def index

    if params[:bought_tickets]
      @tickets = Ticket.where(buyer_id: current_user.id)
    elsif params[:sold_tickets]
      @tickets = Ticket.where(seller_id: current_user.id) 
    elsif params[:concert]
      @tickets = Ticket.where(concert_id: params[:concert], status: 'available')
    elsif params[:venue]
      @concerts = Concert.where(venue_id: params[:venue])
     
      @concerts.each do |concert|
        @tickets = Ticket.where(concert_id: concert.id, status: 'available')
      end

    # elsif params[:artist_id]
    #   @shows = BandConcert.where(band_id: params[:artist_id])
    #   @tickets = Ticket.where(concert_id: @shows.concert_id)
    
    else
      @tickets = Ticket.where(status: 'available')
      render 'index.html.erb'
    end
  end

  def new
    if params[:concert_id]
      @concerts = Concert.find_by(id: params[:concert_id])
    else
      @concerts = Concert.all
    end
    render 'new.html.erb'
  end

  def create
    @ticket = Ticket.new(
      seller_id: current_user.id,
      concert_id: params[:concert],
      compensation: params[:compensation]
      )
    @ticket.save
    redirect_to '/tickets'
  end

  def show
    @ticket = Ticket.find_by(id: params[:id])
    @concert = Concert.find_by(id: @ticket.concert_id)
    @headliner = @concert.bands.first.name
    @spotify = Unirest.get("https://api.spotify.com/v1/search",
      parameters: {
        q: @headliner,
        type: "artist"}).body
    if @spotify['artists']['items'][0]
      @genres = @spotify['artists']['items'][0]['genres']
      @uri = @spotify['artists']['items'][0]['uri']
      @picture = @spotify['artists']['items'][0]['images'][0]['url']
    end
  end

  def edit
    @ticket = Ticket.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @ticket = Ticket.find_by(id: params[:id])
    @ticket.seller_id = params[:seller_id]
    @ticket.compensation = params[:compensation]
    @ticket.buyer_id = params[:buyer_id]
    @ticket.status = params[:status]
    @ticket.concert_id = params[:concert_id]
    if params[:payment_status] == 'Payment Recieved'
      @ticket.seller_paid = true
    else
      #may have to update if we allow users to update tickets so the status doesnt revert back to false
      @ticket.seller_paid = false
    end
    @ticket.save

    if params[:buyer_id] == current_user.id
      @seller = User.find_by(id: params[:seller_id])
      @concert = Concert.find_by(id: @ticket.concert_id)
      @event = UserConcert.new(user_id: current_user.id, concert_id: @concert.id)
      @event.save
      flash[:success] = 'Ticket bought!'

      send_message(@seller.phone, "A user has bought your ticket to the #{@concert.bands.first} show")
      redirect_to '/tickets'
    end

  end

  def destroy

  end

    private

      def send_message(phone_number, alert_message)

        @client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV['TWILIO_AUTH_TOKEN'] 
        @twilio_number = ENV['TWILIO_NUMBER']
        message = @client.messages.create(
          :from => @twilio_number,
          :to => ENV['MY_NUMBER'],
          :body => alert_message
        )
        puts message.to
      end

end
