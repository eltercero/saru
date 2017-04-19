module Kame
  module Connection
    class User < Abstract::Base

    private

      def path
        "#{base_path}/user-information"
      end

    end
  end
end