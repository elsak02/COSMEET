require 'date'
require 'yaml'

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
  validates_presence_of :name, :gender, :sexual_preference, controller_name: 'preferences'
  validates_presence_of :birth_date, :birth_time, :birth_place, controller_name: 'birth_infos'
  # validates_presence_of :photo, controller_name: 'photos'
  validates_presence_of :relationship_type, controller_name: 'relationship_types'
  # validates_presence_of :element_ranking, controller_name: 'element_rankings'
  # validates_presence_of :mode_ranking, controller_name: 'mode_rankings'
  has_many :user_matches
  has_many :matches, through: :user_matches
  has_many :messages
  has_many :compatibilities, class_name: 'Compatibility', foreign_key: 'user_id'
  has_many :received_compatibilities, class_name: 'Compatibility', foreign_key: 'receiver_id'

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

  #do we need it??? find below method find_sign
  def sign
    chart_elements.where(planet: "Sun").first.sign
  end

  #do we need it??? find below method first_content
  def content
    chart_elements.where(planet: "Sun").first.content.split(".").first(3).join(".")+"."
  end

  def short_content
    sample = YAML.load(open(Rails.root.join("db", "yaml", "love_traits_signs.yml")).read)
    sample["signs"][self.sign.downcase]
  end

  def find_sign(planet)
    chart_elements.where(planet: planet).first.sign
  end

   def first_content(planet)
    chart_elements.where(planet: planet).first.content.split(".").first(3).join(".")+"."
  end

  def score_compatibility(user)
    score = self.compatibilities.where(receiver_id: user.id).first.compatibility_score

    # if score >= 75
    #   score = 3
    # elsif score >= 50
    #   score = 2
    # else
    #   score = 1
    # end
  end

  def describe_compatibility(user)
    compatibilities.where(receiver_id: user.id).first.compatibility_description
  end
end
