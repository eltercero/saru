module Saru
  module Setup

    API_KEY = ENV["WANIKANI_API_KEY"]

    attr_accessor :api_key

    def self.extended(base)
      base.set
    end

    def setup
      yield self
    end

    def set
      self.api_key = API_KEY
    end

    def valid?
      api_key.present?
    end

  end
end