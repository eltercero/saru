require 'date'

module Saru
  module Support
    module TimeConverter

      def to_unix date
        [Date, DateTime].include?(date.class) ? date.strftime("%s").to_i : date
      end

    end
  end
end