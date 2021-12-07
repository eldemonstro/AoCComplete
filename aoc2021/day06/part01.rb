module AoC2021
  module Day06
    class Part01 < ::Puzzle
      def execute
        fishes = input[0].split(',').map(&:to_i)

        80.times do
          new_fishes = []
          fishes = fishes.map do |fish|
            fish -= 1
            if fish < 0 
              fish = 6
              new_fishes << 8
            end
            fish
          end
          fishes += new_fishes
        end

        @answer = fishes.count
      end
    end
  end
end