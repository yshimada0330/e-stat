require_relative 'e-stat/configuration'
require_relative 'e-stat/client'
require_relative 'e-stat/version'

module EStat
  extend Configuration

  def self.client(options = {})
    EStat::Client.new(options)
  end

  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  def self.respond_to?(method, include_all = false)
    return client.respond_to?(method, include_all) || super
  end
end
