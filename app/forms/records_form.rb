class RecordsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :myname, :string
  attribute :old, :integer
  attribute :fromdate, :date
  attribute :todate, :date
  attribute :yourname, :string
  attribute :getup, :integer
  attribute :cleanup, :integer
  attribute :note, :integer

end