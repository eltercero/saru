module Saru
  module Connection
    class Kanji < Base

    private

      def path
        "#{base_path}/kanji/#{levels_request}"
      end

    end
  end
end