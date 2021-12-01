module AoC2015
  module Day08
    class Part01 < ::Puzzle
      def execute
        @answer = input.reduce(0) do |quantity, line|
          string = line[1..-2]
          string.gsub!(/\\x[0-9a-f]{2}/i) { |match| match[2..-1].hex.chr }
          string.gsub!(/\\\\/i, '\\')
          string.gsub!(/\\"/i, '"')
          quantity + (line.length - string.length)
        end
      end
    end
  end
end