module AoC2015
  module Day05
    class Part02 < ::Puzzle
      def execute
        @answer = input.reduce(0) do |nices, string|
          next nices if !string.match(/(.).\1/)
          next nices if !string.match(/(..).{0,}\1/)

          nices + 1
        end
      end
    end
  end
end