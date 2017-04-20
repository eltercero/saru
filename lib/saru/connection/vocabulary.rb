module Saru
  module Connection
    class Vocabulary < Base

    private

      def path
        "#{base_path}/vocabulary/#{levels_request}"
      end

    end
  end
end