class Parking < ApplicationRecord

  #In the future the client may want new kinds of status, example: overnight
  enum status: {
    in_progress: 0,
    finished: 1
  }, _prefix: :status

  validates :plate, presence: true
  validates_format_of :plate, with: /\A\w{3}\-\d{4}\z/

  def self.create_default(plate)
    parking = Parking.create(plate: plate)
    [parking.persisted?, parking]
  end

  def duration
    TimeDifference.between(self.created_at, self.finished_at || Time.zone.now).humanize
  end
end
