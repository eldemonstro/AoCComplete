module AoC2022
  module Day03
    class Part01 < ::Puzzle
      def execute
        rucksacks = input.map do |rucksack|
          rucksack.split('').each_slice(rucksack.size / 2).map(&:to_a)
        end

        letter_indexes = (?a..?z).to_a + (?A..?Z).to_a

        priorities = rucksacks.map do |rucksack|
          shared_item = rucksack[0] & rucksack[1]
          letter_indexes.index(shared_item[0]) + 1
        end

        @answer = priorities.sum
      end
    end
  end
end