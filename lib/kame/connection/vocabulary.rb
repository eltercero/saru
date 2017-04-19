module Kame
  module Connection
    class Vocabulary < Abstract::Base

      attr_reader :level

      def initialize level
        @level = level
      end

    private

      def path
        "#{base_path}/vocabulary/#{level}"
      end

    end
  end
end