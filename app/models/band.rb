class Band < ApplicationRecord
  has_many :band_concerts
  has_many :concerts, through: :band_concerts
end
