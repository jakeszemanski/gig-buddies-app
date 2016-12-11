class Band < ApplicationRecord
  belongs_to :concert
  belongs_to :calendar
  has_many :band_concerts
  has_many :concerts, through: :band_concerts
end
