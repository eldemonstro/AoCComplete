module AoC2021
  module Day02
    class Part02 < ::Puzzle
      def execute
        depth = 0
        horizontal = 0
        aim = 0

        input.each do |op|
          command, value = op.scan(/(\w+)\s(\d+)/).flatten

          case command
          when 'forward'
            horizontal += value.to_i
            depth += value.to_i * aim
          when 'up'
            aim -= value.to_i
          when 'down'
            aim += value.to_i
          end
        end

        @answer = horizontal * depth
      end
    end
  end
end