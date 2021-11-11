module AoC2015
  module Day07
    class Part01 < ::Puzzle
      def execute
        @cache = {}
        @collection = input.map do |command|
          command.split(' -> ').reverse
        end.to_h

        @answer = find_value('a')
      end

      private

      attr_accessor :collection, :cache

      def find_value(identifier)
        return identifier.to_i if identifier.to_i.to_s == identifier

        op = collection[identifier]

        @cache[identifier] ||= do_op(op)
      end

      def do_op(op)
        case op.split(' ').count
        when 1 # Assumed lonely value, not assumed integer tho
          find_value(op)
        when 2 # Assumed "NOT" op
          find_value(op.split(' ')[1]) ^ 65535
        when 3
          value1, command, value2 = op.split(' ')
          case command
          when 'AND'
            find_value(value1) & find_value(value2)
          when 'OR'
            find_value(value1) | find_value(value2)
          when 'LSHIFT'
            find_value(value1) << find_value(value2)
          when 'RSHIFT'
            find_value(value1) >> find_value(value2)
          end
        end
      end
    end
  end
end