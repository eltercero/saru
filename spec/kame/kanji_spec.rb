require 'spec_helper'
require 'json'

describe Kame::Kanji do

  let(:character) { '二' }
  let(:meaning) { 'two' }
  let(:onyomi) { 'に' }
  let(:kunyomi) { 'ふた' }
  let(:unlocked_date) { 1457072478 }

  let(:attributes) do
    {
      character: character,
      meaning: meaning,
      onyomi: onyomi,
      kunyomi: kunyomi,
      important_reading: "onyomi",
      unlocked_date: 1457072478,
    }
  end

  subject { described_class.new attributes }

  describe '#character' do
    it 'returns the value' do
      expect(subject.character).to eq character
    end
  end

  describe '#meaning' do
    it 'returns the value' do
      expect(subject.meaning).to eq meaning
    end
  end

  describe '#wanikani_reading' do
    it 'returns the value' do
      expect(subject.wanikani_reading).to eq onyomi
    end
  end
end