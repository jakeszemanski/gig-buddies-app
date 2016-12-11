class Ticket < ApplicationRecord
  belongs_to :seller, class_name: :User, foreign_key: :seller_id
  belongs_to :buyer, class_name: :User, foreign_key: :buyer_id
  belongs_to :concert
  has_many :bands, through: :concerts
end
