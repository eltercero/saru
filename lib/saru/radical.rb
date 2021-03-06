require 'saru/support/attributes'

module Saru
  class Radical
    include Saru::Support::Attributes

    attr_reader :character, :meaning, :image, :level,
                :unlocked_date, :user_synonyms, :meaning_note,
                :reading_note, :srs, :srs_numeric, :available_date,
                :burned, :burned_date, :reactivated_date,
                :meaning_correct, :meaning_incorrect,
                :meaning_max_streak, :meaning_current_streak,
                :reading_correct, :reading_incorrect,
                :reading_max_streak, :reading_current_streak

  end
end