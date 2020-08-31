class PhotosForm
  include ActiveModel::Model

  attr_accessor(
    :photo
  )

  validates :photo, presence: true
end
