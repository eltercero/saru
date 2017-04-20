require 'saru/connection/base'
require 'saru/connection/radical'
require 'saru/connection/kanji'
require 'saru/connection/vocabulary'

module Saru
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