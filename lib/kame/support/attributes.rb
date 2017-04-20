module Kame
  module Support
    module Attributes

      def initialize args
        assign_attributes args
      end

      def assign_attributes args
        args.each do |attribute, value|
          instance_variable_set("@#{attribute}", value) unless value.nil?
        end
        self
      end

    end
  end
end