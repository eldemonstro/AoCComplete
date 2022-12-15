module AoC2022
  module Day06
    class Part02 < ::Puzzle
      def execute
        packet_index = 0
        message = input[0].split('')

        (0..message.length).each_with_index do |index|
          break packet_index = (index+14) if message[index..(index+13)].uniq.length == 14
        end

        @answer = packet_index
      end
    end
  end
end