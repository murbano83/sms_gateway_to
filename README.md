# SmsGatewayTo

SMSGatewayTo gem is a ruby wrapper for the smsgateway.to service.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sms_gateway_to'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sms_gateway_to

## Usage

To use the gem as a standalone library

```ruby
	# Product token aka API key from smsgateway.to 
	
	client = SmsGatewayTo::Client.new("producttoken") 

	# To send an sms 
	# from - The from address in the sms
	# to   - The number you want to send the sms to
	# message - The text message you want to send

	client.send_message(from, to, message)
	
	# Same as above but will raise error based on the backend response
	
	begin
	   client.send_message!(from, to, message)
	rescue SmsGatewayTo::StandardError, SmsGatewayTo::ParameterError
	   # Do something
	end
```

If you are using it with rails


1. Create a smsgateway.yaml file in the config folder of the rails app

```ruby
	# Sample smsgateway.yaml file
	
	development:
		token: dev-token
	production:
		token: production-token
	test:
		token: test-token
```

2. The Gem will automatically chose the right token based on the environment.

```ruby
	client = SmsGatewayto.client # returns default client based on the environment
	client.send_message(from, to, message)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/h0lyalg0rithm/sms_gateway_to. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

