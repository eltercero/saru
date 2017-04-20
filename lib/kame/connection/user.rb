module Kame
  module Connection
    class User < Base

    private

      def path
        "#{base_path}/user-information"
      end

    end
  end
end