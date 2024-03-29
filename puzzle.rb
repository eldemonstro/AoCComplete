class Puzzle
  def self.execute
    new.tap do |puzzle|
      puzzle.execute
      puzzle.result
    end
  end

  def result
    raise "Don\'t forget to implement the @answer" unless @answer
    puts "The answer for #{self.class.name} is: #{@answer}"
  end

  private

  attr_accessor :answer

  def input
    @input ||= raw_input.split("\n")
  end

  def raw_input
    @raw_input ||= File.open(File.expand_path("..", self.method(:execute).source_location[0]) + "/input.txt").read
  end
end