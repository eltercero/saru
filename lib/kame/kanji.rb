require 'kame/support/attributes'

module Kame
  class Kanji
    include Kame::Support::Attributes

    attr_reader :character, :kana, :meaning, :onyomi, :kunyomi,
                :important_reading, :level, :nanori,
                :unlocked_date, :user_synonyms, :meaning_note,
                :reading_note, :srs, :srs_numeric, :available_date,
                :burned, :burned_date, :reactivated_date,
                :meaning_correct, :meaning_incorrect,
                :meaning_max_streak, :meaning_current_streak,
                :reading_correct, :reading_incorrect,
                :reading_max_streak, :reading_current_streak

    def wanikani_reading
      send important_reading
    end

  end
end