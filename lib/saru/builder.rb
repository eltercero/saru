require 'saru/list'
require 'saru/radical'
require 'saru/kanji'
require 'saru/vocabulary'

module Saru
  class Builder
    TYPES = %w(radical kanji vocabulary)

    attr_reader :type, :levels

    def initialize type, levels = nil
      @type  = type
      @levels = levels
    end

    def call
      raise ArgumentError, 'Not valid type' unless TYPES.include?(type)

      build
    end

  private

    def build
      request_items = request['requested_information']
      items = request_items.map{|item| build_class.new flatten(item) }

      List.new items
    end

    def request
      Connection.send(type, levels)
    end

    def build_class
      Module.const_get "Saru::#{type.capitalize}"
    end

    def flatten item
      item.merge(item['user_specific'])
          .delete_if{|key, _value| key == 'user_specific' }
    end

  end
end