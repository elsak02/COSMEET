class PreferencesForm
  include ActiveModel::Model

  attr_accessor(
    :name,
    :gender,
    :biography,
    :sexual_preference,
    :age_preference
  )
  validates :name, presence: true
  validates :gender, presence: true
  validates :sexual_preference, presence: true
  validates :age_preference, presence: true
end
