require 'spec_helper'
require 'json'

describe Saru::List do

  let(:kanjis_json) do
    JSON.parse File.read( 'spec/support/files/large_kanji_response.json' )
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

  subject { described_class.new kanjis }

  describe '#to_anki' do
    let(:anki) { double 'anki' }

    it 'relies in Anki class' do
      expect(Saru::Anki).to receive(:new).
        with(subject.items).and_return anki

      expect(anki).to receive(:deck)

      subject.to_anki
    end
  end

  describe '#export_to_anki' do
    let(:anki) { double 'anki' }

    it 'relies in Anki class' do
      expect(Saru::Anki).to receive(:new).
        with(subject.items).and_return anki

      expect(anki).to receive(:generate)

      subject.export_to_anki
    end
  end

  describe 'all methods' do
    it 'returns the expected results' do
      # #size
      expect(subject.size).to eq 132

      # AvailableDate
      jun_2017 = DateTime.parse('2017/06/01')
      jun_2017_unix = jun_2017.strftime("%s").to_i

      available_june_2017_1 = subject.available_after(jun_2017)
      available_june_2017_2 = subject.available_after(jun_2017_unix)

      expect(available_june_2017_1.size).to eq available_june_2017_2.size

      available_may_2017 = subject.available_before(jun_2017).items
      expect(available_may_2017.all?{|item| item.available_date < jun_2017_unix}).to eq true

      # UnlockedDate
      jan_2017 = DateTime.parse('2017/01/01')

      before_2017 = subject.unlocked_before(jan_2017)
      in_2017 = subject.unlocked_after(jan_2017)

      expect(before_2017.size + in_2017.size).to eq 100

      # Incorrect
      expect(subject.meaning_incorrect_smaller_than(20).size).to eq 100
      expect(subject.meaning_incorrect_larger_than(5).size).to eq 4

      expect(subject.reading_incorrect_smaller_than(10).size).to eq 100
      expect(subject.reading_incorrect_smaller_than(2).size).to eq 76

      expect(subject.total_incorrect_smaller_than(10).size).to eq 98
      expect(subject.total_incorrect_smaller_than(2).size).to eq 55

      # Srs
      all_guru = subject.srs_is_guru.items
      expect(all_guru.all?{|item| item.srs == 'guru'}).to eq true

      nonsense = subject.srs_is_guru.srs_is_not_guru
      expect(nonsense.size).to eq 0

      better_than_master = subject.srs_numeric_larger_than(7)
      expect(better_than_master.items.none?{|item| item.srs == 'master'}).to eq true

      # KanjiRelated
      shi = subject.onyomi_is("し")
      expect(shi.size).to eq 1

      shi = subject.kunyomi_is("し")
      expect(shi.size).to eq 0

      han = subject.important_reading_is("はん")
      expect(han.size).to eq 3

      # Chanining methods
      need_to_study_soon = subject.srs_is_not_burned
                                  .total_incorrect_larger_than(5)
                                  .available_before(jun_2017)

      expect(need_to_study_soon.size).to eq 6
    end
  end

end