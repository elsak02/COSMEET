class Like < ApplicationRecord
  belongs_to :user # , class_name: 'User', foreign_key: :user_id
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id

  def create_match
    if user.liked_by?(receiver)
      match = Match.create
      UserMatch.create!(match: match, user: user)
      UserMatch.create!(match: match, user: receiver)
      return match
    end
    nil
  end
end
