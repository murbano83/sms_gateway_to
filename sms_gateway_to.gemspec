# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sms_gateway_to/version'

Gem::Specification.new do |spec|
  spec.name          = "sms_gateway_to"
  spec.version       = SmsGatewayTo::VERSION
  spec.authors       = ["Suraj Shirvankar"]
  spec.email         = ["surajshirvankar@gmail.com"]

  spec.summary       = "Ruby Wrapper for smsgateway.to "
  spec.description   = ""
  spec.homepage      = "https://github.com/h0lyalg0rithm/sms_gateway_to"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.10.8"
  spec.add_dependency "httparty", "~> 0.13.7"
  spec.add_development_dependency "bundler", "~> 1.17.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
