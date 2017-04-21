require 'saru/list/available_date'
require 'saru/list/unlocked_date'
require 'saru/list/incorrect'
require 'saru/list/srs'
require 'saru/list/kanji_related'
require 'saru/anki'

module Saru
  class List
    extend Forwardable
    include Saru::List::AvailableDate
    include Saru::List::UnlockedDate
    include Saru::List::Incorrect
    include Saru::List::Srs
    include Saru::List::KanjiRelated

    attr_reader :items

    def initialize items
      @items = items
    end

    def to_anki
      anki.deck
    end

    def export_to_anki
      anki.generate
    end

    def_delegator :@items,
                  :size

  private

    def anki
      @anki ||= Saru::Anki.new(items)
    end
  end
end