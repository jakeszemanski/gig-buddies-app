class Venue < ApplicationRecord
  has_many :concerts
  has_many :reviews
end
