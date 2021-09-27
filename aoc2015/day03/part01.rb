module AoC2015
  module Day03
    class Part01 < ::Puzzle
      def execute
        coordinates = [0, 0] # [x, y]
        grid = {"0x0" => 1}
        input[0].split('').each do |direction|
          case direction
          when '>'
            coordinates = [coordinates[0] + 1, coordinates[1]]
          when '<'
            coordinates = [coordinates[0] - 1, coordinates[1]]
          when '^'
            coordinates = [coordinates[0], coordinates[1] + 1]
          else # when 'v'
            coordinates = [coordinates[0], coordinates[1] - 1]
          end

          grid["#{coordinates[0]}x#{coordinates[1]}"] = grid["#{coordinates[0]}x#{coordinates[1]}"].to_i + 1 
        end

        @answer = grid.values.compact.count
      end
    end
  end
end