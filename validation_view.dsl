dynamic * "BookingPlatformValidatingRegistration" {
	title "Possible pattern for Booking Platform validating registration"

	operator -> shortTermLets "Registers property as a short term let"
	operator -> bookingPlatform "Lists property on platform"
	bookingPlatform -> shortTermLets "Sends registration number and property address"
	shortTermLets -> bookingPlatform "Confirms the registration number is valid"
}
