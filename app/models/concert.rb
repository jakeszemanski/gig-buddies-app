class Concert < ApplicationRecord
  has_many :band_concerts
  has_many :bands, through: :band_concerts
  has_many :tickets
  belongs_to :venue
  belongs_to :calendar
  has_many :user_concerts
  has_many :users, through: :user_concerts


  def friendly_date
    friendly_date = date.strftime("%A, %b %d")
  end

  def date_and_headliner
    return bands.first.name + ' ' + date.strftime("%A, %b %d") + " at " + Venue.find_by(id: venue_id).name
  end
end
