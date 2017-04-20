module Kame
  class List
    module AvailableDate

      def available_after date
        unix_time = date.is_a?(DateTime) ? date.strftime("%s").to_i : date

        Kame::List.new items.select{|item| item.available_date > unix_time }
      end

      def available_before date
        unix_time = date.is_a?(DateTime) ? date.strftime("%s").to_i : date

        Kame::List.new items.select{|item| item.available_date < unix_time }
      end

    end
  end
end