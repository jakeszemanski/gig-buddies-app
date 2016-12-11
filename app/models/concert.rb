class Concert < ApplicationRecord
  has_many :band_concerts
  has_many :bands, through: :band_concerts
  has_many :tickets
  belongs_to :venue
  belongs_to :calendar
end
