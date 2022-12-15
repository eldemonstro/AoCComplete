module AoC2022
  module Day05
    class Part02 < ::Puzzle
      def execute
        crates, instructions = input.slice_when { |v| v == "" }.to_a

        sanitized_crates = crates_to_array(crates).transpose.map(&:compact)

        instructions.each do |instruction|
          quantity, from, to = instruction.scan(/move (\d+) from (\d+) to (\d+)/).flatten.map(&:to_i)

          taken_crates = sanitized_crates[from - 1].pop(quantity)
          sanitized_crates[to - 1].concat(taken_crates)
        end
        
        @answer = sanitized_crates.map(&:last).join('')
      end

      def crates_to_array(crates)
        column_count = crates[-2].split('').map(&:to_i).max

        columns = crates[0..-3].reverse.map do |row|
          chunk_size = row.length / column_count
          crates = row.chars.each_slice(4).map(&:join)

          crates.map { |crate| crate.scan(/[A-Z]/)[0] }
        end
      end
    end
  end
end