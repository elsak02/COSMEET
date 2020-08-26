class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chart_elements
  has_many :given_likes, class_name: 'Like', foreign_key: 'giver_id'
  has_many :received_likes, class_name: 'Like', foreign_key: 'receiver_id'
  has_many :user_matches
  has_many :matches, through: :user_matches
  has_many :messages
  has_many_attached :photos


  geocoded_by :birth_place
  after_validation :geocode, if: :will_save_change_to_birth_place?

  RELATIONSHIP_TYPES = ["Un amour galactique #veryserious",
    "Le Big Bang céleste #friendswithbenefits",
    "Partir en exploration #justcurious"
  ]

  ELEMENT_RANKING = []

  MODE_RANKING = []
end
