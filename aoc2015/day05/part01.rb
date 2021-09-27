module AoC2015
  module Day05
    class Part01 < ::Puzzle
      def execute
        @answer = input.reduce(0) do |nices, string|
          next nices if string.match(/ab|cd|pq|xy/)
          next nices if !string.match(/(.)\1/)
          next nices if string.scan(/a|e|i|o|u/).count < 3

          nices + 1
        end
      end
    end
  end
end