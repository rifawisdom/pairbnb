class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
  	ReservationMailer.reservation_email(args[0], args[1], args[2])
  end
end