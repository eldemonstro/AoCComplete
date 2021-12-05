module AoC2021
  module Day04
    class Part02 < ::Puzzle
      def execute
        uncalled_numbers = input.shift.split(',').map(&:to_i)

        boards = input.filter { |str| !str.empty? }.each_slice(5).map { |board| board.map { |string| string.split.map(&:to_i) } }

        called_numbers = do_bingo(boards, uncalled_numbers)

        @answer = (boards.flatten.filter { |n| !called_numbers.include?(n) }).sum * called_numbers.last
      end

      private

      def do_bingo(boards, uncalled_numbers)
        (1..uncalled_numbers.size).each do |i|
          called_numbers = uncalled_numbers.take(i)
          
          boards.each do |board|
            if validate_bingo(board, called_numbers) && boards.count > 1
              boards.delete(board)
            elsif validate_bingo(board, called_numbers) && boards.count == 1
              return called_numbers
            end
          end
        end
      end

      def validate_bingo(board, called_numbers)
        board.each do |row|
          return true if (row & called_numbers).size == 5
        end

        board.transpose.each do |row|
          return true if (row & called_numbers).size == 5
        end

        false
      end
    end
  end
end