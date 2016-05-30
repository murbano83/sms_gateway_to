require "sms_gateway_to/version"
require "sms_gateway_to/rails"
require "sms_gateway_to/client"
require "sms_gateway_to/config"

module SmsGatewayTo

	class << self
		attr_accessor :config
		@@config = nil
		def configure(credentials)
			@@config = SmsGatewayTo::Config.new(credentials)
			@@client = build_client
		end
		def config
			@@config
		end

		def client
			@@client
		end

		def build_client
			SmsGatewayTo::Client.new(@@config.token)
		end
	end
end