class Match < ApplicationRecord
  has_many :user_matches
  has_many :messages

  def find_user(user_match)
    User.find(user_match.user_id)
  end
end
