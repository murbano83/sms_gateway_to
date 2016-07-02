require 'spec_helper'

describe SmsGatewayTo::ErrorHandler do
  it 'has a version number' do
    error = SmsGatewayTo::ErrorHandler.new("test")
    expect(error.error).to eq "test"
  end

  context "error_handler" do
    it 'raises generic error' do
      error_handler = SmsGatewayTo::ErrorHandler.new("Error: ERROR some error") 
      expect{ error_handler.response }.to raise_error(SmsGatewayTo::StandardError)
    end
    it 'raises producttoken error' do
      error_handler = SmsGatewayTo::ErrorHandler.new("Error: ERROR Parameter 'producttoken' contains an invalid value: '<producttoken>'")
      expect{ error_handler.response }.to raise_error(SmsGatewayTo::ParameterError)
    end
    it 'raises sendername error' do
      error_handler = SmsGatewayTo::ErrorHandler.new("Error: ERROR No sender name provided")
      expect{ error_handler.response }.to raise_error(SmsGatewayTo::ParameterError)
    end
    it 'raises body missing error' do
      error_handler = SmsGatewayTo::ErrorHandler.new("Error: ERROR Parameter 'body' is required")
      expect{ error_handler.response }.to raise_error(SmsGatewayTo::ParameterError)
    end
    it 'raises sender number error' do
      error_handler = SmsGatewayTo::ErrorHandler.new("Error: ERROR Parameter 'to' contains an invalid value: '<msisdn>'")
      expect{ error_handler.response }.to raise_error(SmsGatewayTo::ParameterError)
    end
  end

end
