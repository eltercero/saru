require 'saru/support/attributes'

module Saru
  class Vocabulary
    include Saru::Support::Attributes

    attr_reader :character, :kana, :meaning, :level,
                :unlocked_date, :user_synonyms, :meaning_note,
                :reading_note, :srs, :srs_numeric, :available_date,
                :burned, :burned_date, :reactivated_date,
                :meaning_correct, :meaning_incorrect,
                :meaning_max_streak, :meaning_current_streak,
                :reading_correct, :reading_incorrect,
                :reading_max_streak, :reading_current_streak

    def meanings
      meaning.to_s.split(',').map(&:strip)
    end

  end
end