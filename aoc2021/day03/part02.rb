module AoC2021
  module Day03
    class Part02 < ::Puzzle
      def execute
        oxygen = input.dup
        carbon = input.dup

        input[0].length.times do |i|
          oxygen_bit = oxygen.map { |o2| o2[i] }
          carbon_bit = carbon.map { |c2| c2[i] }

          common_bit = most_common_bit(oxygen_bit)
          uncommon_bit = least_common_bit(carbon_bit)

          oxygen.filter! { |measurement| measurement[i] == common_bit }   if oxygen.count > 1
          carbon.filter! { |measurement| measurement[i] == uncommon_bit } if carbon.count > 1
        end

        @answer = oxygen[0].to_i(2) * carbon[0].to_i(2)
      end

      private

      def most_common_bit(measurement)
        zero_count = measurement.count('0')
        one_count = measurement.count('1')

        return '1' if zero_count == one_count

        zero_count > one_count ? '0' : '1'
      end

      def least_common_bit(measurement)
        zero_count = measurement.count('0')
        one_count = measurement.count('1')

        return '0' if zero_count == one_count

        zero_count > one_count ? '1' : '0'
      end
    end
  end
end
