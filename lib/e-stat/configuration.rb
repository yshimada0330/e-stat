require 'faraday'

module EStat
  module Configuration
    OPTIONS_KEYS = [:app_id, :lang, :version, :format, :base_url, :adapter].freeze

    DEFAULT_APP_ID = nil

    # J or E. defulat 'J'
    DEFAULT_LANG = nil

    DEFAULT_VERSION = '2.0'

    DEFAULT_FORMAT = 'json'

    DEFAULT_BASE_URL = 'http://api.e-stat.go.jp/rest/'.freeze

    DEFAULT_ADAPTER = Faraday.default_adapter

    attr_accessor *OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    def reset
      self.app_id = DEFAULT_APP_ID
      self.lang = DEFAULT_LANG
      self.version = DEFAULT_VERSION
      self.format = DEFAULT_FORMAT
      self.base_url = "#{DEFAULT_BASE_URL}#{DEFAULT_VERSION}/app"
      self.adapter = DEFAULT_ADAPTER
    end
  end
end
