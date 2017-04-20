require 'spec_helper'
require 'json'

describe Kame::Builder do

  let(:type) { 'kanji' }
  let(:levels) { 1 }

  subject { described_class.new type, levels }

  describe '#call' do
    let!(:response) do
      JSON.parse File.read( 'spec/support/files/kanji_response.json' )
    end

    before do
      allow(Kame::Connection).to receive(:kanji).
        with(levels).and_return response
    end

    it 'returns a List object with two Kanji objects' do
      list = subject.call
      expect(list).to be_a Kame::List

      kanjis = list.items
      expect(kanjis.size).to eq 2

      ni = kanjis.find{|kanji| kanji.onyomi == "に" }
      expect(ni.character).to eq "二"
      expect(ni.wanikani_reading).to eq "に"
    end
  end

end