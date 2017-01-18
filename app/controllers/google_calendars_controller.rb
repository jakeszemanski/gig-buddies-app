class GoogleCalendarsController < ApplicationController

  def create
    Unirest.post("https://www.googleapis.com/calendar/v3/calendars/primary/events?key=#{ENV['GOOGLE_API_KEYd']}", 
      parameters: 
      {     summary: "concert name",
            description: "bands playing",
            location: "venue",
            start: {
              dateTime: "2017-01-17T09:00:00-06:00",
              timeZone: "America/Chicago"
        },
        end: {
          dateTime: "2017-01-17T10:00:00-06:00",
          timeZone: "America/Chicago"
        }
        })
    redirect_to '/concerts'
  end

end
