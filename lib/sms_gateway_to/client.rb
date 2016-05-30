require 'httparty'

module SmsGatewayTo
	class Client
		include HTTParty
  		base_uri 'https://sgw01.cm.nl'
  		attr_reader :product_token

  		def initialize(product_token)
  			@product_token = product_token
  		end

  		def send_message(from, to, message)
		    self.class.get("/gateway.ashx", { query: {producttoken: @product_token, from: from, to: to, body: message}})
		  end
	end
end