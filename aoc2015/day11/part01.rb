module AoC2015
  module Day11
    class Part01 < ::Puzzle
      def execute
        pass = input[0]

        while !valid_pass?(pass) do
          pass = pass.split('').reverse.reduce([1, 0, pass.split('')]) do |memo, char|
            new_value = char.bytes[0] + memo[0]
            carry = 0

            if new_value == 123
              new_value = 97
              carry = 1
            end

            memo[2][memo[1]] = new_value

            [carry, memo[1] + 1, memo[2]]
          end[2].reverse.pack('c*')
        end

        @answer = pass
      end

      def valid_pass?(pass)
        return false if pass.scan(/i|o|l/).any?
        return false unless pass.split('').each_cons(3).map do |triple|
          bytes = triple.join('').bytes

          [bytes.min, bytes.min + 1, bytes.min + 2] == bytes
        end.any?

        return false unless pass.split('').each_cons(2).reduce([]) do |memo, double|
          memo << double.join('') if double[0] == double[1] && !memo.include?(double.join(''))
          memo
        end.count == 2

        true
      end
    end
  end
end