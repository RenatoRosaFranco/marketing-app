# frozen_string_literal: true

class Contact <:: Object
	include ActiveModel::Conversion
	include ActiveModel::Validations
	include Mailerable

	attr_accessor :name, :email, :phone, :company,
							  :company_size, :website, :state, :city,
							  :message

	def initialize(params = {})
		@name = params[:name]
		@email = params[:email]
		@phone = params[:phone]
		@company = params[:company]
		@company_size = params[:company_size]
		@website = params[:website]
		@state = params[:state]
		@city = params[:city]
		@message = params[:message]

		@mailer = ContactMailer
	end

	def send_email
		mail_to(@mailer, :sended)
		mail_to(@mailer, :received)
	end

	def persisted?
		false
	end
end	