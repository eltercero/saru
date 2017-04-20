require 'kame/list/available_date'
require 'kame/list/unlocked_date'
require 'kame/list/level'
require 'kame/list/incorrect'
require 'kame/list/srs'
require 'kame/list/kanji_related'

module Kame
  class List
    extend Forwardable
    include Kame::List::AvailableDate
    include Kame::List::UnlockedDate
    include Kame::List::Level
    include Kame::List::Incorrect
    include Kame::List::Srs
    include Kame::List::KanjiRelated

    attr_reader :items

    def initialize items
      @items = items
    end

    def_delegator :@items,
                  :size

  end
end