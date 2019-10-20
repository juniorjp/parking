class Parking < ApplicationRecord

  #In the future the client may want new kinds of status, example: overnight
  enum status: {
    in_progress: 0,
    finished: 1
  }

  validates :plate, presence: true
  validates_format_of :plate, with: /\A\w{3}\-\d{4}\z/
end
