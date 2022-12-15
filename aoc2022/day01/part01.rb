module AoC2022
  module Day01
    class Part01 < ::Puzzle
      def execute

        elfs_cal = input.slice_when { |v| v == "" }.map do |elf|
          elf.map(&:to_i).sum
        end

        @answer = elfs_cal.max
      end
    end
  end
end