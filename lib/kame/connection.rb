require 'kame/connection/base'
require 'kame/connection/radical'
require 'kame/connection/kanji'
require 'kame/connection/vocabulary'

module Kame
  module Connection

    def user level=nil
      User.new(level).call
    end

    def radical level=nil
      Radical.new(level).call
    end

    def kanji level=nil
      Kanji.new(level).call
    end

    def vocabulary level=nil
      Vocabulary.new(level).call
    end

  end
end