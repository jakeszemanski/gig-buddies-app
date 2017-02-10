class User < ApplicationRecord
  has_secure_password

  has_many :reviews
  has_many :bought_tickets, class_name: :Ticket, foreign_key: :buyer_id
  has_many :sold_tickets, class_name: :Ticket, foreign_key: :seller_id
  has_many :user_concerts
  has_many :concerts, through: :user_concerts
end
