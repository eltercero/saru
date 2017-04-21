require 'spec_helper'
require 'json'

describe Saru::Anki do

  let(:kanjis_json) do
    JSON.parse File.read( 'spec/support/files/kanji_response.json' )
  end

  let(:kanjis) do
    request_items = kanjis_json['requested_information']
    request_items.map do |item|
      flattened = if item['user_specific']
        item.merge(item['user_specific'])
            .delete_if{|key, _value| key == 'user_specific' }
      end

      flattened ||= item

      Saru::Kanji.new flattened
    end
  end

  let(:list) { Saru::List.new kanjis }

  subject { described_class.new list.items }

  describe '#generate' do
    let(:anki_deck) { double 'anki_deck' }

    it 'relies in Anki class' do
      expect(::Anki::Deck).to receive(:new).
        with(anything).and_return anki_deck

      expect(anki_deck).to receive(:generate_deck).
        with(anything)

      subject.generate
    end
  end

end