module Kame
  module Connection
    class Radical < Base

      attr_reader :level

      def initialize level
        @level = level
      end

    private

      def path
        "#{base_path}/radicals/#{level}"
      end

    end
  end
end