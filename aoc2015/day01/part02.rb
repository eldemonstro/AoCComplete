module AoC2015
  module Day01
    class Part02 < ::Puzzle
      def execute
        floor = 0
        index = 0
        input[0].split('').each do |direction|
          index = index + 1
          floor = direction == '(' ? floor + 1 : floor - 1
          break if floor < 0
        end
        @answer = index
      end
    end
  end
end
