# README

 This app allows users to list tickets to upcoming concerts in the Chicago area, create a calendar of events, create events in their personal Google Calendar, as well as write reviews for venues. 


* Link to live app: https://limitless-dawn-50528.herokuapp.com/
 
* Rails 5.0.0

* Events are scraped from venue websites using the nokogiri gem, every 12 hours using the rufus-scheduler gem in: config/initializers/task_schedule

* Data being scraped from sites: 
  -Concert date
  -Concert doors time
  -Concert show time
  -Names of bands playing
  -Description of band, if there is one available
  -Picture of band. If none available, a search is made to the Spotify API in order to find one. If none is found, a default is applied

* Concert index page is built using AngularJS to filter and search 

* Uses a Postgresql with the following database connections: https://docs.google.com/spreadsheets/d/1zbDtmKqf0RM-CZskwvr347BXm6XzWPO5VDVY6xlvr9I/edit?usp=sharing

* Concert show page makes calls to the following APIs
  -Google API for Google Maps location of venue
  -Google API for the ability to add the concert to the users Google Calendar
  -Spotify API for genres of the band, as well as the band's URI. The band's URI is used to create a playlist for the band on a widget on the band show page
  -Yahoo Weather API for weather the day of the show. That data is then plugged into a card at the bottom of the concert show page



