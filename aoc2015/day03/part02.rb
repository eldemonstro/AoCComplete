module AoC2015
  module Day03
    class Part02 < ::Puzzle
      def execute
        coordinates_santa = [0, 0] # [x, y]
        coordinates_robo  = [0, 0] # [x, y]
        grid = {"0x0" => 1}
        input[0].split('').each_slice(2) do |directions|
          santa, robo = directions
          
          case santa
          when '>'
            coordinates_santa = [coordinates_santa[0] + 1, coordinates_santa[1]]
          when '<'
            coordinates_santa = [coordinates_santa[0] - 1, coordinates_santa[1]]
          when '^'
            coordinates_santa = [coordinates_santa[0], coordinates_santa[1] + 1]
          else # when 'v'
            coordinates_santa = [coordinates_santa[0], coordinates_santa[1] - 1]
          end

          grid["#{coordinates_santa[0]}x#{coordinates_santa[1]}"] = grid["#{coordinates_santa[0]}x#{coordinates_santa[1]}"].to_i + 1

          case robo
          when '>'
            coordinates_robo = [coordinates_robo[0] + 1, coordinates_robo[1]]
          when '<'
            coordinates_robo = [coordinates_robo[0] - 1, coordinates_robo[1]]
          when '^'
            coordinates_robo = [coordinates_robo[0], coordinates_robo[1] + 1]
          else # when 'v'
            coordinates_robo = [coordinates_robo[0], coordinates_robo[1] - 1]
          end

          grid["#{coordinates_robo[0]}x#{coordinates_robo[1]}"] = grid["#{coordinates_robo[0]}x#{coordinates_robo[1]}"].to_i + 1 
        end

        @answer = grid.values.compact.count
      end
    end
  end
end