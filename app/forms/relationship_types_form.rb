class RelationshipTypesForm
  include ActiveModel::Model

  attr_accessor(
    :relationship_type
  )

  validates :relationship_type, presence: true
end

