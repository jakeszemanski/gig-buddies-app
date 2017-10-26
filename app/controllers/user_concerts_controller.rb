class UserConcertsController < ApplicationController
require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'Google Calendar API Ruby Quickstart'
CLIENT_SECRETS_PATH = 'client_secret.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "calendar-ruby-quickstart.yaml")
SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

require 'fileutils'

  def create
    @event = UserConcert.new(user_id: current_user.id, concert_id: params[:concert_id])
    @event.save
    
    redirect_to "/concerts?calendar=#{current_user.id}"
  end

 



  


  def add_to_google_calendar

        # def authorize
        puts "making directory"
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))
  puts "directory created"

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(
    client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(
      base_url: OOB_URI)
    puts "Open the following URL in the browser and enter the " +
         "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI)
  end
  credentials
# end

# Initialize the API
service = Google::Apis::CalendarV3::CalendarService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize
        event = Google::Apis::CalendarV3::Event.new({
                        summary: 'Google I/O 2015',
                        location: '800 Howard St., San Francisco, CA 94103',
                        description: 'A chance to hear more about Googles developer products.',
                        start: {
                          date_time: '2017-01-28T09:00:00-07:00',
                          time_zone: 'America/Los_Angeles',
                        },
                        end: {
                          date_time: '2015-05-28T17:00:00-07:00',
                          time_zone: 'America/Los_Angeles',
                        }
                      })
       result = service.insert_event('primary', event)
       puts "Event created: #{result.html_link}"
     end
end
