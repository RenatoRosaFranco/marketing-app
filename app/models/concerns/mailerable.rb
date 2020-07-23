# frozen_string_literal: true

module Mailerable
	include ActiveSupport::Concern

	def mail_to(mailer, method, object = self, deliver_method = :deliver_now)
		logger = Rails.logger

		begin
			mailer.send(method, object).send(deliver_method)				
		rescue Exception => e
			logger.error e
			raise StandardError, e
		end
	end
end