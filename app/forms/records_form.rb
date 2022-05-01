class RecordsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :myname, :string
  attribute :old, :integer

  validates :myname, :old, presence: true
end