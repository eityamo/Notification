class RecordsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :myname, :string
  attribute :old, :string
  attribute :fromdate, :date, default: -> { Time.now }
  attribute :todate, :date, default: -> { Time.now.since(1.day) }
  attribute :yourname, :string
  attribute :note, :integer
  attribute :remark, :string
  attribute :getup, :string
  attribute :cleanup, :string
  
end