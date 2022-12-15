module AoC2022
  module Day03
    class Part02 < ::Puzzle
      def execute
        rucksacks = input.each_slice(3).map { |group| group.map { |rucksack| rucksack.split('') } }

        letter_indexes = (?a..?z).to_a + (?A..?Z).to_a

        priorities = rucksacks.map do |group|
          shared_item = group[0] & group[1] & group[2]
          letter_indexes.index(shared_item[0]) + 1
        end

        @answer = priorities.sum
      end
    end
  end
end