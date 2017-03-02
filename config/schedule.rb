# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# every :hour do
#   empty_bottle_doc = Nokogiri::HTML(open('http://www.emptybottle.com/full/'))

#   empty_bottle_show_html = empty_bottle_doc.css('div.tw-plugin-full-event-list ul li div.show_full')
#   empty_bottle_show_details = empty_bottle_show_html.map do |link|
#     {
#       date: link.css('span.show_details span.show_date span.tw-event-date-complete span.tw-event-date').text.strip,
#       time: link.css('span.show_details span.show_date span.tw-event-time-complete span.tw-event-time').text.strip,
#       artists: link.css('span.show_details span.show_artists ul li').children.map { |el| el.to_s.strip },
#       picture: link.css('span.show_image img @src').text.strip,
#       description: link.css('span.show_description p').text.strip
#     }
#   end
  
#   empty_bottle_show_details.each do |show|
#     show.bands[0]
#     if Concert.find_by(bands: show)

# end
# @sql_concert = Concert.find_by_sql(SELECT * FROM concerts WHERE bands @> ARRAY['Birdcloud']::varchar[];)
# SQL = SELECT * FROM concerts WHERE bands @> ARRAY['Birdcloud']::varchar[];