module AoC2021
  module Day07
    class Part01 < ::Puzzle
      def execute
        crabs = input[0].split(',').map(&:to_i).sort
        median_crab = crabs[(crabs.size / 2)]

        fuel = crabs.map do |crab|
          (crab - median_crab).abs
        end

        @answer = fuel.sum
      end
    end
  end
end