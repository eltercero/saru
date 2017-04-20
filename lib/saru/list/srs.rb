module Saru
  class List
    module Srs

      def srs_numeric_larger_than number
        Saru::List.new items.select{|item| item.srs_numeric > number }
      end

      def srs_numeric_smaller_than number
        Saru::List.new items.select{|item| item.srs_numeric < number }
      end

      def srs_in states
        Saru::List.new items.select{|item| states.include? item.srs }
      end

      %w(apprentice guru master enlighten burned).each do |state|
        define_method "srs_is_#{state}".to_sym do
          Saru::List.new items.select{|item| item.srs == state }
        end

        define_method "srs_is_not_#{state}".to_sym do
          Saru::List.new items.select{|item| item.srs != state }
        end
      end

    end
  end
end