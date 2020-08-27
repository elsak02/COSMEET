require 'date'
class User < ApplicationRecord
  RELATIONSHIP_TYPES = ["Un amour galactique #veryserious",
    "Le Big Bang céleste #friendswithbenefits",
    "Partir en exploration #justcurious"
  ]
  ELEMENT_RANKING = []
  MODE_RANKING = []
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chart_elements
  has_many :given_likes, class_name: 'Like', foreign_key: 'user_id'
  has_many :received_likes, class_name: 'Like', foreign_key: 'receiver_id'
  has_many :user_matches
  has_many :matches, through: :user_matches
  has_many :messages
  has_many_attached :photos
  has_one_attached :chart

  geocoded_by :birth_place
  after_validation :geocode, if: :will_save_change_to_birth_place?

  def liked_by?(user)
    # likes.find { |like| like.receiver == user } # In Ruby
    received_likes.where(user: user).any?
  end

  def age(birth_date)
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end

  def sign(user)
    user.chart_elements.where(planet: "Sun").first.sign.downcase
  end

  def find_sign(planet)
    user.chart_elements.where(planet: planet).first.sign.downcase
  end


  def compatibility(user_2)
    #PopulateCompatibilityJob.perform_now(current_user, user_2)["compatibility_report"] ???????
  end
end
