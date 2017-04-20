module Kame
  class List
    module Level

      def in_levels number
        Kame::List.new items.select{|item| Array(number).include?(item.level) }
      end

      alias_method :in_level, :in_levels

      def level_larger_than number
        Kame::List.new items.select{|item| item.level > number }
      end

      def level_smaller_than number
        Kame::List.new items.select{|item| item.level < number }
      end

    end
  end
end