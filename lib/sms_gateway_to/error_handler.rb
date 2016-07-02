module SmsGatewayTo
  class ErrorHandler
    attr_accessor :error
     
    def initialize(error)
      @error = error
    end

    def response
      case @error
      when /Error: ERROR Parameter 'body' is required/
        raise SmsGatewayTo::ParameterError.new('Body is required')
      when /Error: ERROR Parameter \'(\w+)\'/
        raise SmsGatewayTo::ParameterError.new("#{$1} is invalid")
      when /Error: ERROR No sender name provided/
        raise SmsGatewayTo::ParameterError.new("Sender name is required")
      when /Error: ERROR (.+)/
        raise SmsGatewayTo::StandardError.new("#{$1}")
      else raise SmsGatewayTo::StandardError 
      end
    end

  end
end
