$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'e-stat'
require 'webmock/rspec'
require 'vcr'

module Helpers
  def valid_app_id
    $stderr.puts "Please set valid_token to ENV['APP_ID']" if ENV['APP_ID'].nil?
    @app_id ||= ENV['APP_ID'] || (print 'app_id: '; gets.strip)
  end

  def valid_client
    @valid_client ||= EStat::Client.new(app_id: valid_app_id)
  end
end

include Helpers

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.configure_rspec_metadata!
  c.filter_sensitive_data("<APP_ID>") { valid_app_id }
end
