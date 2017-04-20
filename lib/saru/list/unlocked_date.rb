module Saru
  class List
    module UnlockedDate

      def unlocked_after date
        unix_time = date.is_a?(DateTime) ? date.strftime("%s").to_i : date

        Saru::List.new items.select{|item| item.unlocked_date > unix_time }
      end

      def unlocked_before date
        unix_time = date.is_a?(DateTime) ? date.strftime("%s").to_i : date

        Saru::List.new items.select{|item| item.unlocked_date < unix_time }
      end

    end
  end
end