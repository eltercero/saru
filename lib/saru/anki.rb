require 'anki'
require 'date'

module Saru
  class Anki
    attr_reader :items

    def initialize items
      @items = items
    end

    def deck
      raise NotImplementedError, 'Radicals not supported' if items.first.is_a?(Saru::Radical)

      @deck ||= ::Anki::Deck.new card_headers: %w(front back tags),
                               card_data: card_data
    end

    def generate
      file_path = "saru_deck_#{timestamp}.txt"

      deck.generate_deck file: file_path
      puts "Anki file generated in #{file_path}"
    end

  private

    def card_data
      items.map do |item|
        {
          'front' => item.character,
          'back'  => back_for(item),
          'tags'  => item.class.name.split('::').last
        }
      end
    end

    def timestamp
      @timestamp ||= DateTime.now.strftime("%y%m%d%H%M")
    end

    def back_for item
      case item
        when Saru::Kanji      then "#{item.meaning} —— #{item.important_reading}"
        when Saru::Vocabulary then "#{item.meaning} —— #{item.kana}"
      end
    end

  end
end