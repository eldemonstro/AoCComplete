module AoC2022
  module Day02
    class Part02 < ::Puzzle
      def execute
        rock = :A
        paper = :B
        scissors = :C

        to_lose = :X
        to_draw = :Y
        to_win = :Z

        game_table = {
          "#{rock}": {
            score: 1,
            "#{to_win}": 2,
            "#{to_draw}": 1,
            "#{to_lose}": 3
          },
          "#{paper}": {
            score: 2,
            "#{to_win}": 3,
            "#{to_draw}": 2,
            "#{to_lose}": 1
          },
          "#{scissors}": {
            score: 3,
            "#{to_win}": 1,
            "#{to_draw}": 3,
            "#{to_lose}": 2
          },
          "#{to_lose}": {
            score: 0
          },
          "#{to_draw}": {
            score: 3
          },
          "#{to_win}": {
            score: 6
          }
        }

        scores = input.map do |round|
          you, todo = round.split(' ').map(&:to_sym)

          game_table[you][todo] + game_table[todo][:score]
        end

        @answer = scores.sum
      end
    end
  end
end