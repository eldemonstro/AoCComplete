module AoC2015
  module Day09
    class Part02 < ::Puzzle
      def execute
        map = {}
        input.each do |line|
          line.scan(/([A-z]+) to ([A-z]+) = (\d+)/).each do |(from, to, dist)|
            map[from] ||= {}
            map[to] ||= {}
            map[from][to] = dist.to_i
            map[to][from] = dist.to_i
          end
        end

        max = 0

        map.keys.permutation.each do |route|
          dist = 0
          route.each_cons(2) do |from, to|
            dist += map[from][to]
          end
          max = dist if dist > max
        end

        @answer = max
      end
    end
  end
end