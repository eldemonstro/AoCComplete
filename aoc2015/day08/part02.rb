module AoC2015
  module Day08
    class Part02 < ::Puzzle
      def execute
        @answer = input.reduce(0) do |quantity, line|
          quantity + line.count('\\') + line.count('"') + 2
        end
      end
    end
  end
end