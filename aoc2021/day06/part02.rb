module AoC2021
  module Day06
    class Part02 < ::Puzzle
      def execute
        fishes = input[0].split(',').map(&:to_i).tally
     
        (0..8).each do |i|
          fishes[i] ||= 0
        end
        
        256.times do |i|
          new_fishes = fishes[0]
          fishes[0]  = fishes[1]
          fishes[1]  = fishes[2]
          fishes[2]  = fishes[3]
          fishes[3]  = fishes[4]
          fishes[4]  = fishes[5]
          fishes[5]  = fishes[6]
          fishes[6]  = fishes[7] + new_fishes
          fishes[7]  = fishes[8]
          fishes[8]  = new_fishes
        end

        @answer = fishes.sum { |k, v| v }
      end
    end
  end
end