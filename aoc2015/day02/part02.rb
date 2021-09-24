module AoC2015
  module Day02
    class Part02 < ::Puzzle
      def execute
        @answer = input.map do |package|
          size = package.split('x').map(&:to_i) # [l, w, h]
          volume = size.reduce(:*)
          ribbon = size.min(2).map { |i| i * 2 }.sum
          @answer = volume + ribbon
        end.sum
      end
    end
  end
end