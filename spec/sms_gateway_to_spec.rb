require 'spec_helper'

describe SmsGatewayTo do
  it 'has a version number' do
    expect(SmsGatewayTo::VERSION).not_to be nil
  end
  it 'stores the token' do
  	yaml = YAML::load(File.read('spec/fixtures/config.yml'))['test']
  	token = yaml['token']
  	SmsGatewayTo.configure(yaml)
  	expect(SmsGatewayTo.config.token).to eq token
  end
  it 'client loads token' do
  	client = SmsGatewayTo::Client.new("Test")
  	expect(client.product_token).to eq "Test"
  end
end
