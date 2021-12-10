module AoC2021
  module Day07
    class Part02 < ::Puzzle
      def execute
        crabs = input[0].split(',').map(&:to_i).sort
        average_crab = (crabs.sum.to_f / crabs.size.to_f).round

        binding.pry

        fuel = crabs.map do |crab|
          (1..(average_crab - crab).abs).to_a.sum
        end

        @answer = fuel.sum
      end
    end
  end
end