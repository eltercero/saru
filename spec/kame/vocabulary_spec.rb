require 'spec_helper'
require 'json'

describe Kame::Vocabulary do

  let(:character) { '二' }
  let(:kana) { 'に' }
  let(:meaning) { 'two' }

  let(:attributes) do
    {
      character: character,
      kana: kana,
      meaning: meaning
    }
  end

  subject { described_class.new attributes }

  describe '#character' do
    it 'returns the value' do
      expect(subject.character).to eq character
    end
  end

  describe '#kana' do
    it 'returns the value' do
      expect(subject.kana).to eq kana
    end
  end

  describe '#meaning' do
    it 'returns the value' do
      expect(subject.meaning).to eq meaning
    end
  end
end