class Match < ApplicationRecord
  has_many :user_matches
  has_many :messages
end
