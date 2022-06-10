class RecordsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  after_validation :vertical_stamp

  attribute :myname, :string
  attribute :stamp, :string
  attribute :old, :integer
  attribute :fromdate, :date, default: -> { Time.now }
  attribute :todate, :date, default: -> { Time.now.since(1.day) }
  attribute :yourname, :string
  attribute :remark, :string
  attribute :getup, :string
  attribute :cleanup, :string

  validates :myname, { length: { maximum: 10 } }
  validates :stamp, { length: { maximum: 4 } }
  validates :yourname, { length: { maximum: 10 } }
  validates :remark, { length: { maximum: 131 } }
  validate :start_end_check

  def start_end_check
    errors.add(:todate, "は開始日より前の日付は登録できません。") unless self.fromdate < self.todate
  end

  private

  def vertical_stamp
    self.stamp = vertical(self.stamp) if self.stamp.length == 4
  end

  def vertical(stamp)
    part = stamp.split('')
    part[2]+part[0]+part[3]+part[1]
  end
end