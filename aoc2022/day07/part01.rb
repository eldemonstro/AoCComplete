module AoC2022
  module Day07
    class Part01 < ::Puzzle
      def execute
        dir_stack = []
        dir_tree = []

        input.each do |log_line|
          log = log_line.split(' ')

          if log[0] == '$' && log[1] == 'cd'
            log[2] == '..' ? dir_stack.pop : dir_stack.push(log[2])
          elsif log[0].to_i != 0
            dir_tree.push(dir_stack.dup.push(log[1]).reverse.inject(log[0].to_i) { |assigned_value, key| [key, assigned_value] })
          end
        end

        sum_dirs = {}
        files = {}

        dir_tree.each do |dir|
          dir = dir.flatten

          file_size = dir.pop
          file = dir.pop

          while dir.length > 0
            sum_dirs[dir.join("/")] ||= 0
            sum_dirs[dir.join("/")] += file_size
            dir.pop
          end

          files[file] = file_size
        end

        @answer = sum_dirs.to_a.filter { |dir| dir[1] <= 100_000 }.sum { |dir| dir[1] }
      end
    end
  end
end