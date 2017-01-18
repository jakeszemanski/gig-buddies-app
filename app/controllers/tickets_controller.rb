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
    @ticket.save
    
    @seller = User.find_by(id: params[:seller_id])
    @concert = Concert.find_by(id: @ticket.concert_id)

    send_message(@seller.phone, "A user has bought your ticket to the #{@concert.bands.first.name} show")
    

    flash[:message] = 'ticket successfully updated!'
    redirect_to '/tickets'

  end

  def destroy

  end

    private

      def send_message(phone_number, alert_message)

        @client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV['TWILIO_AUTH_TOKEN'] 
        @twilio_number = ENV['TWILIO_NUMBER']
        message = @client.messages.create(
          :from => @twilio_number,
          :to => phone_number,
          :body => alert_message
        )
        puts message.to
      end

end
