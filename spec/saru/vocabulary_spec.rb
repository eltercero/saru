require 'spec_helper'
require 'json'

describe Saru::Vocabulary do

  let(:character) { '非難する' }
  let(:kana) { 'ひなんする' }
  let(:meaning) { 'to criticize, to criticise' }

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

  describe '#meaning, #meanings' do
    it 'returns the value' do
      expect(subject.meaning).to eq meaning
      meanings = subject.meanings
      expect(meanings.size).to eq 2
      expect(meanings).to eq ['to criticize', 'to criticise']
    end
  end
end