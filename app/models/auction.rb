class Auction < ActiveRecord::Base
  # Remember to create a migration!
  has_many :bids
  has_one :user
end
