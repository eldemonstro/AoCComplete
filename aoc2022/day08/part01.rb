module AoC2022
  module Day08
    class Part01 < ::Puzzle
      def execute
        tree_map = input.map { |row| row.split('').map(&:to_i) }

        visible_count = 0

        (0..(tree_map.count - 1)).each do |y|
          (0..(tree_map[0].count - 1)).each do |x|
            next visible_count += 1 if y == tree_map.count - 1 || y == 0 || x == tree_map.count - 1 || x == 0

            tree_map_row = tree_map.dup[y]
            tree_map_column = tree_map.dup.transpose[x]


            visible_count += 1 if tree_map[y][x] > [ (tree_map_row[..(x-1)]).max, (tree_map_column[..(y-1)]).max, 
                                                     (tree_map_row[(x+1)..]).max, (tree_map_column[(y+1)..]).max ].min
          end
        end

        @answer =  visible_count
      end
    end
  end
end