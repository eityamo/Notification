class RecordsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :myname, :string
  attribute :old, :string
  attribute :fromdate, :date
  attribute :todate, :date
  attribute :yourname, :string
  attribute :note, :integer
  attribute :remark, :string
  attribute :getup, :string
  attribute :cleanup, :string
  
end