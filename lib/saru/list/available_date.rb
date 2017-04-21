require 'saru/support/time_converter'

module Saru
  class List
    module AvailableDate
      include Saru::Support::TimeConverter

      def available_after date
        selected = items.select do |item|
          !item.available_date.nil? &&
          item.available_date > to_unix(date)
        end

        Saru::List.new selected
      end

      def available_before date
        selected = items.select do |item|
          !item.available_date.nil? &&
          item.available_date < to_unix(date)
        end

        Saru::List.new selected
      end

      def avaliable_between start_date, end_date
        selected = items.select do |item|
          !item.unlocked_date.nil? &&
          item.available_date > to_unix(start_date) &&
          item.available_date < to_unix(end_date)
        end

        Saru::List.new selected
      end

    end
  end
end