module AoC2021
  module Day01
    class Part02 < ::Puzzle
      def execute
        sums = input.map(&:to_i).each_cons(3).map(&:sum)

        previous_depth = sums[0]
        increments = 0

        sums.each do |depth|
          increments += 1 if depth.to_i > previous_depth.to_i
          previous_depth = depth
        end

        @answer = increments
      end
    end
  end
end
