module AoC2015
  module Day06
    class Part01 < ::Puzzle
      def execute
        grid = Array.new(1000) { Array.new(1000) { false } }

        input.each do |command|
          op, x1, y1, x2, y2 = command.match(/(turn on|turn off|toggle)\s(\d+),(\d+)\sthrough\s(\d+),(\d+)/).captures
          
          (x1.to_i..x2.to_i).each do |x|
            (y1.to_i..y2.to_i).each do |y|
              grid[x][y] = if op == 'turn on'
                             true
                           elsif op == 'turn off'
                             false
                           else
                             !grid[x][y]
                           end
            end
          end
        end

        @answer = grid.flatten.count(true)
      end
    end
  end
end

