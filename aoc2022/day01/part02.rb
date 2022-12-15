module AoC2022
  module Day01
    class Part02 < ::Puzzle
      def execute

        elfs_cal = input.slice_when { |v| v == "" }.map do |elf|
          elf.map(&:to_i).sum
        end

        @answer = elfs_cal.max(3).sum
      end
    end
  end
end