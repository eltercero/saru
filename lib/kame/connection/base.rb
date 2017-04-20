module Kame
  module Connection
    class Base

      ENDPOINT_HOST = "https://www.wanikani.com"
      ENDPOINT_BASE = "/api"

      WanikaniConnectionError = Class.new(StandardError)

      attr_reader :levels

      def initialize levels
        @levels = levels
      end

      def call
        response.status == 200 ? content : raise_error
      end

    private

      def response
        raise ArgumentError, 'Missing API key' unless Kame::Setup.valid?
        @response ||= connection.get path
      end

      def content
        @content ||= JSON.parse(response.body)
      end

      def connection
        @connection ||= Faraday.new ENDPOINT_HOST do |connection|
          connection.headers[ 'Content-Type' ] = 'application/json'
          connection.adapter :net_http
        end
      end

      def base_path
        "#{ENDPOINT_BASE}/#{Kame::Setup.api_key}"
      end

      def levels_request
        Array(levels).join(',')
      end

      def raise_error
        raise WanikaniConnectionError, %Q{
          Wanikani responded with #{response.status} (expecting 200)

          request: GET #{path}

          response:
            #{response.inspect}
        }
      end

    end
  end
end