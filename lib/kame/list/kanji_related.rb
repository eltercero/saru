module Kame
  class List
    module KanjiRelated

      def important_reading_is reading
        kunyomi = kunyomi_is(reading).items
        onyomi  = onyomi_is(reading).items

        Kame::List.new kunyomi+onyomi
      end

      def onyomi_is onyomi
        selected = items.select do |item|
          item.is_a?(Kame::Kanji) &&
          item.onyomis.include?(onyomi)
        end

        Kame::List.new selected
      end

      def kunyomi_is kunyomi
        selected = items.select do |item|
          item.is_a?(Kame::Kanji) &&
          item.kunyomis.include?(kunyomi)
        end

        Kame::List.new selected
      end

    end
  end
end