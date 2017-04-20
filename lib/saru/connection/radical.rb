module Saru
  module Connection
    class Radical < Base

    private

      def path
        "#{base_path}/radicals/#{levels_request}"
      end

    end
  end
end