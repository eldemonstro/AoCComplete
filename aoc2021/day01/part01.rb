module AoC2021
  module Day01
    class Part01 < ::Puzzle
      def execute
        previous_depth = input[0]
        increments = 0

        input.each do |depth|
          increments += 1 if depth.to_i > previous_depth.to_i
          previous_depth = depth
        end

        @answer = increments
      end
    end
  end
end
