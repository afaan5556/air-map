class Report < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :airmap
  has_one :user, through: :airmap
end
