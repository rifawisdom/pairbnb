class ReservationMailer < ApplicationMailer
	def reservation_email(customer, host, reservation_id)
		@url = "http://localhost:3000/listings/9"
		@customer = customer.first_name
		@host = host
		@reservation_id = reservation_id

		mail(to: "ariff.next@gmail.com", subject: 'Welcome to My Awesome Site')
	end
end
