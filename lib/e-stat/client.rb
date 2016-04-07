require File.expand_path('../connection', __FILE__)
require File.expand_path('../request', __FILE__)
require File.expand_path('../configuration', __FILE__)
require File.expand_path('../endpoint', __FILE__)

module EStat
  class Client
    attr_accessor(*Configuration::OPTIONS_KEYS)

    def initialize(options = {})
      options = EStat.options.merge(options)
      Configuration::OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Connection
    include Request
    include Endpoint

    def endpoint
      return base_url if format.nil?

      "#{base_url}/#{format}"
    end
  end
end
