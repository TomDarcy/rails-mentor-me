class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :mentor

  # def start_time=(datetime_str)
  #   self.start_time = DateTime.parse(datetime_str)
  # end

  # def end_time=(datetime_str)
  #   self.end_time = DateTime.parse(datetime_str)
  # end
end
