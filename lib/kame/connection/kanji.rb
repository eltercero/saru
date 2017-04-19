module Kame
  module Connection
    class Kanji < Abstract::Base

      attr_reader :level

      def initialize level
        @level = level
      end

    private

      def path
        "#{base_path}/kanji/#{level}"
      end

    end
  end
end