module Saru
  class List
    module KanjiRelated

      def important_reading_is reading
        kunyomi = kunyomi_is(reading).items
        onyomi  = onyomi_is(reading).items

        Saru::List.new kunyomi+onyomi
      end

      def onyomi_is onyomi
        selected = items.select do |item|
          item.is_a?(Saru::Kanji) &&
          item.onyomis.include?(onyomi)
        end

        Saru::List.new selected
      end

      def kunyomi_is kunyomi
        selected = items.select do |item|
          item.is_a?(Saru::Kanji) &&
          item.kunyomis.include?(kunyomi)
        end

        Saru::List.new selected
      end

    end
  end
end