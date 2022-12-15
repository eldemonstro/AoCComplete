module AoC2022
  module Day06
    class Part01 < ::Puzzle
      def execute
        packet_index = 0
        message = input[0].split('')

        (0..message.length).each_with_index do |index|
          break packet_index = (index+4) if message[index..(index+3)].uniq.length == 4
        end

        @answer = packet_index
      end
    end
  end
end