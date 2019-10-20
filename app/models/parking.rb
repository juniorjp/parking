class Parking < ApplicationRecord

  #In the future the client may want new kinds of status, example: overnight
  enum status: {
    in_progress: 0,
    finished: 1
  }
end
