module AoC2021
  module Day08
    class Part01 < ::Puzzle
      def execute
        unique_segments = [4, 7, 3, 2]

        codes = input.map do |line|
          (line.split('|')[1].split(' ').map(&:length).filter { |l| unique_segments.include?(l) })
        end

        @answer = codes.flatten.length
      end
    end
  end
end