class Compatibility < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id

  #validates :receiver_id, uniqueness: { scope: :user_id }

end
