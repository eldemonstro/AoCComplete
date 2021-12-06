module AoC2021
  module Day03
    class Part01 < ::Puzzle
      def execute
        columns = input.map { |column| column.split('') }.transpose

        gamma_values = columns.map { |column| column.tally.max_by{ |k, v| v }[0] }.join
        epsilon_values = gamma_values.gsub("0", "2").gsub("1", "0").gsub("2", "1")

        @answer = gamma_values.to_i(2) * epsilon_values.to_i(2)
     end
    end
  end
end
