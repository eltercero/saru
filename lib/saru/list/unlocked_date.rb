require 'saru/support/time_converter'

module Saru
  class List
    module UnlockedDate
      include Saru::Support::TimeConverter

      def unlocked_after date
        Saru::List.new items.select{|item| item.unlocked_date > to_unix(date) }
      end

      def unlocked_before date
        unix_time = date.is_a?(DateTime) ? date.strftime("%s").to_i : date

        Saru::List.new items.select{|item| item.unlocked_date < to_unix(date) }
      end

      def unlocked_between start_date, end_date
        selected = items.select do |item|
          item.unlocked_date > to_unix(start_date) &&
          item.unlocked_date < to_unix(end_date)
        end

        Saru::List.new selected
      end

    end
  end
end