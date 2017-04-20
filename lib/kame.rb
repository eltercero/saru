require "kame/connection"
require "kame/builder"

require "kame/setup"
require "kame/version"

module Kame
  extend Setup

  def radicals levels=nil
    Builder.new('radical', levels).call
  end

  def kanji levels=nil
    Builder.new('kanji', levels).call
  end

  def vocabulary levels=nil
    Builder.new('vocabulary', levels).call
  end
end
