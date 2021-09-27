require 'digest'

module AoC2015
  module Day04
    class Part01 < ::Puzzle
      def execute
        hash = ""
        @answer = -1
        while(!hash.start_with?("00000")) do
          @answer += 1
          hash = Digest::MD5.hexdigest("#{input[0]}#{@answer}")
        end
      end
    end
  end
end