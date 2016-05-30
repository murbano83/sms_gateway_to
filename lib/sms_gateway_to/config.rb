module SmsGatewayTo
	class Config
		attr_reader :token
		def initialize(cred)
			@token = cred['token']
		end
	end
end