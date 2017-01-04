class Concert < ApplicationRecord
  has_many :band_concerts
  has_many :bands, through: :band_concerts
  has_many :tickets
  belongs_to :venue
  belongs_to :calendar
  has_many :user_concerts
  has_many :users, through: :user_concerts
  belongs_to :tickets
end
