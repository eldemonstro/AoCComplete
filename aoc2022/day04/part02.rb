module AoC2022
  module Day04
    class Part02 < ::Puzzle
      def execute
        ranges = input.map do |pair|
          pair.split(',').map do |elf|
            a, b = elf.split('-')

            ((a.to_i)..(b.to_i)).to_a
          end
        end

        comparissons = ranges.map do |pair|
          comparisson = pair[0] & pair[1]

          comparisson.any?
        end

        @answer = comparissons.count(true)
      end
    end
  end
end