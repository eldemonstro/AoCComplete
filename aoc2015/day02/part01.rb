module AoC2015
  module Day02
    class Part01 < ::Puzzle
      def execute
        @answer = input.map do |package|
          l, w, h = package.split('x').map(&:to_i) # [l, w, h]
          2*l*w + 2*w*h + 2*h*l + ([l*w, w*h, h*l].min)
        end.sum
      end
    end
  end
end