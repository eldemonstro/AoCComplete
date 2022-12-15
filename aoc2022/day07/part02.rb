module AoC2022
  module Day07
    class Part02 < ::Puzzle
      def execute
        dir_stack = []
        dir_tree = []
        total_disc_space = 70_000_000
        required_disk_space = 30_000_000

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
          file_path = dir.join('/')

          file_size = dir.pop
          file = dir.pop

          while dir.length > 0
            sum_dirs[dir.join("/")] ||= 0
            sum_dirs[dir.join("/")] += file_size
            dir.pop
          end

          files[file_path] = file_size
        end

        files_sum = files.values.sum
        free_space = total_disc_space - files_sum

        @answer = sum_dirs.to_a.filter { |dir| (dir[1] + free_space) >= required_disk_space  }.map(&:last).min
      end
    end
  end
end