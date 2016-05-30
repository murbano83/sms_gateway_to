require 'yaml'

module SmsGatewayTo

  if Object.const_defined?(:Rails) and Rails.const_defined?(:Railtie)
    class Railtie < Rails::Railtie
      initializer "sms-gateway-to.initialize" do |app|
        SmsGatewayTo::Rails.setup
      end
    end
  end

  module Rails

  	def self.setup
      load_yaml_config
      nil
    end

    def self.load_yaml_config
      path = Pathname.new("#{rails_root}/config/smsgateway.yml")

      if File.exist?(path)
        cfg = YAML::load(ERB.new(File.read(path)).result)
        credentials = cfg[rails_env]
        unless credentials
          raise "config/smsgateway.yml is missing a section for `#{rails_env}`"
        end
        SmsGatewayTo.configure(credentials)
      else
        raise "config/smsgateway.yml doesnt exist"
      end

    end

    protected

    def self.rails_env
      ::Rails.respond_to?(:env) ? ::Rails.env : RAILS_ENV
    end

    def self.rails_root
      ::Rails.respond_to?(:root) ? ::Rails.root.to_s : RAILS_ROOT
    end
  end

end