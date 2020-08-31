class BirthInfosForm
  include ActiveModel::Model

  attr_accessor(
    :birth_date,
    :birth_time,
    :birth_place
  )

  validates :birth_date, presence: true
  validates :birth_time, presence: true
  validates :birth_place, presence: true
end
