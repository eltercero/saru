require 'kame/connection/base'
require 'kame/connection/radical'
require 'kame/connection/kanji'
require 'kame/connection/vocabulary'

module Kame
  module Connection

    def radical levels=nil
      Radical.new(levels).call
    end

    def kanji levels=nil
      Kanji.new(levels).call
    end

    def vocabulary levels=nil
      Vocabulary.new(levels).call
    end

  end
end