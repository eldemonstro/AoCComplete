module AoC2022
  module Day02
    class Part01 < ::Puzzle
      def execute
        rock = :A
        paper = :B
        scissors = :C

        vs_rock = :X
        vs_paper = :Y
        vs_scissors = :Z

        game_table = {
          "#{vs_rock}": {
            score: 1,
            loses: paper,
          },
          "#{vs_paper}": {
            score: 2,
            loses: scissors
          },
          "#{vs_scissors}": {
            score: 3,
            loses: rock
          },
          "#{rock}": {
            score: 1
          },
          "#{paper}": {
            score: 2
          },
          "#{scissors}": {
            score: 3
          }
        }

        scores = input.map do |round|
          they, you = round.split(' ').map(&:to_sym)

          game_table[you][:score] + rock_paper_scissors(game_table, they, you)
        end

        @answer = scores.sum
      end

      def rock_paper_scissors(game_table, they, you)
        win = 6
        draw = 3
        loss = 0

        return draw if game_table[you][:score] == game_table[they][:score]
        game_table[you][:loses] == they ? loss : win
      end
    end
  end
end