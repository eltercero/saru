module Kame
  class List
    module Srs

      def srs_numeric_larger_than number
        Kame::List.new items.select{|item| item.srs_numeric > number }
      end

      def srs_numeric_smaller_than number
        Kame::List.new items.select{|item| item.srs_numeric < number }
      end

      def srs_in states
        Kame::List.new items.select{|item| states.include? item.srs }
      end

      %w(apprentice guru master enlighten burned).each do |state|
        define_method "srs_is_#{state}".to_sym do
          Kame::List.new items.select{|item| item.srs == state }
        end

        define_method "srs_is_not_#{state}".to_sym do
          Kame::List.new items.select{|item| item.srs != state }
        end
      end

    end
  end
end