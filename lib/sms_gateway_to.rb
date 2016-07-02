require 'httparty'
require 'sms_gateway_to/version'
require 'sms_gateway_to/rails'
require 'sms_gateway_to/client'
require 'sms_gateway_to/config'
require 'sms_gateway_to/error_handler'
require 'sms_gateway_to/exceptions'

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
