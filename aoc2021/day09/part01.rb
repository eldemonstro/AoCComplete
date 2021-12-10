module AoC2021
  module Day09
    class Part01 < ::Puzzle
      def execute
        grid = input.map { |line| line.chars.map(&:to_i) }

        lowests = []

        grid.each_with_index do |row, y|
          row.each_with_index do |cell, x|
            value_left = x > 0 ? grid[y][x - 1] : 99
            value_right = x < row.size - 1 ? grid[y][x + 1] : 99
            value_up = y > 0 ? grid[y - 1][x] : 99
            value_down = y < grid.size - 1 ? grid[y + 1][x] : 99

            if cell < value_left && cell < value_right && cell < value_up && cell < value_down
              lowests << cell
            end
          end
        end

        @answer = lowests.sum { |l| l + 1}
      end
    end
  end
end