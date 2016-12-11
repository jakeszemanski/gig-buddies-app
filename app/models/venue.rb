class Venue < ApplicationRecord
  has_many :concerts
  has_many :reviews
  belongs_to :calendar
  has_many :bands, through: :concerts
end
