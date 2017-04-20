module Kame
  class List
    module Incorrect

      # Meaning
      def meaning_incorrect_larger_than number
        selected = items.select do |item|
          item.meaning_incorrect.to_i > number
        end
        Kame::List.new selected
      end

      def meaning_incorrect_smaller_than number
        selected = items.select do |item|
          !item.meaning_incorrect.nil? &&
          item.meaning_incorrect < number
        end
        Kame::List.new selected
      end

      # Reading
      def reading_incorrect_larger_than number
        selected = items.select do |item|
          item.reading_incorrect.to_i > number
        end
        Kame::List.new selected
      end

      def reading_incorrect_smaller_than number
        selected = items.select do |item|
          !item.reading_incorrect.nil? &&
          item.reading_incorrect < number
        end
        Kame::List.new selected
      end

      # Total
      def total_incorrect_larger_than number
        selected = items.select do |item|
          total_incorrect = item.meaning_incorrect.to_i + item.reading_incorrect.to_i
          total_incorrect > number
        end
        Kame::List.new selected
      end

      def total_incorrect_smaller_than number
        selected = items.select do |item|
          total_incorrect = item.meaning_incorrect.to_i + item.reading_incorrect.to_i
          total_incorrect < number
        end
        Kame::List.new selected
      end

    end
  end
end