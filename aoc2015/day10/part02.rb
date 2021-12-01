module AoC2015
  module Day10
    class Part01 < ::Puzzle
      def execute
        digits = input[0]

        50.times do |i|
          digits = digits.chars.chunk_while { |a, b| a == b }.map { |island| [island.size, island[0].to_s] }.map(&:join).join
        end

        @answer = digits.size
      end
    end
  end
end