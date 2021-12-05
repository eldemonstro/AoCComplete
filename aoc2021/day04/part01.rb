module AoC2021
  module Day04
    class Part01 < ::Puzzle
      def execute
        uncalled_numbers = input.shift.split(',').map(&:to_i)

        boards = input.filter { |str| !str.empty? }.each_slice(5).map { |board| board.map { |string| string.split.map(&:to_i) } }
        
        called_numbers = uncalled_numbers.shift(5)

        result_found = false
        winner = nil

        while !result_found
          boards.each do |board|
            board.each do |row|
              if (row & called_numbers) == row
                result_found = true
                winner = board
                next
              end
            end

            board.transpose.each do |row|
              if (row & called_numbers) == row
                result_found = true
                winner = board
                next
              end
            end
          end

          called_numbers << uncalled_numbers.shift
        end
        
        @answer = (winner.flatten - called_numbers).sum * called_numbers[-2]
      end
    end
  end
end