require 'spec_helper'
require 'json'

describe Kame::Radical do

  let(:meaning) { 'stick' }
  let(:image) { "https://cdn.wanikani.com/images/radicals/802e9542627291d4282601ded41ad16ce915f60f.png" }
  let(:level) { 1 }
  let(:unlocked_date) { 1456910061 }

  let(:attributes) do
    {
      character: nil,
      meaning: "stick",
      image: image,
      level: level,
      unlocked_date: unlocked_date
    }
  end

  subject { described_class.new attributes }

  describe '#meaning' do
    it 'returns the value' do
      expect(subject.meaning).to eq meaning
    end
  end

  describe '#image' do
    it 'returns the value' do
      expect(subject.image).to eq image
    end
  end

  describe '#level' do
    it 'returns the value' do
      expect(subject.level).to eq level
    end
  end
end