module AoC2015
  module Day01
    class Part01 < ::Puzzle
      def execute
        @answer = input[0].split('').inject(0) do |floor, direction|
          direction == '(' ? floor + 1 : floor - 1
        end
      end
    end
  end
end
