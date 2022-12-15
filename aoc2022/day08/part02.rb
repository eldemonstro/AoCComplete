module AoC2022
  module Day08
    class Part02 < ::Puzzle
      def get_scenic_count(trees, main_tree)
        visible_trees = []
        visible_trees << trees.pop

        while(!trees.empty? && visible_trees.last < main_tree)
          visible_trees << trees.pop
        end

        visible_trees.count
      end

      def execute
        tree_map = input.map { |row| row.split('').map(&:to_i) }

        scenic_value = []

        (0..(tree_map.count - 1)).each do |y|
          (0..(tree_map[0].count - 1)).each do |x|
            tree_map_row = tree_map.dup[y]
            tree_map_column = tree_map.dup.transpose[x]

            visible_left_trees  = x - 1 < 0                    ? 0 : get_scenic_count(tree_map_row[..(x-1)], tree_map[y][x])
            visible_right_trees = x + 1 >= tree_map_row.length ? 0 : get_scenic_count(tree_map_row[(x+1)..].reverse, tree_map[y][x])
            visible_up_trees    = y - 1 < 0                    ? 0 : get_scenic_count(tree_map_column[..(y-1)], tree_map[y][x])
            visible_down_trees  = y + 1 >= tree_map_row.length ? 0 : get_scenic_count(tree_map_column[(y+1)..].reverse, tree_map[y][x])

            scenic_value << visible_down_trees * visible_up_trees * visible_left_trees * visible_right_trees
          end
        end

        @answer = scenic_value.max
      end
    end
  end
end