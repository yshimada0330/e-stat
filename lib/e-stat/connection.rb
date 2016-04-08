require 'faraday_middleware'

module EStat
  module Connection

    private

    def connection
      options = {
        :headers => { Accept: 'application/json; charset=utf-8' },
        :url => endpoint,
      }

      Faraday::Connection.new(options) do |connection|
        connection.use Faraday::Request::Multipart
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::ParseJson
        connection.adapter(adapter)
      end
    end
  end
end
