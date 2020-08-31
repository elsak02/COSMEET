class PreferencesForm
  include ActiveModel::Model

  attr_accessor(
    :name,
    :gender,
    :sexual_preference
  )
  validates :name, presence: true
  validates :gender, presence: true
  validates :sexual_preference, presence: true
end
