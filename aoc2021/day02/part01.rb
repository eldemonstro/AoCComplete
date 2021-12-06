module AoC2021
  module Day02
    class Part01 < ::Puzzle
      def execute
        depth = 0
        horizontal = 0

        input.each do |op|
          command, value = op.scan(/(\w+)\s(\d+)/).flatten

          case command
          when 'forward'
            horizontal += value.to_i
          when 'up'
            depth -= value.to_i
          when 'down'
            depth += value.to_i
          end
        end

        @answer = horizontal * depth
      end
    end
  end
end