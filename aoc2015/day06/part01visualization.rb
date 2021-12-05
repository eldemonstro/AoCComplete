return true

require 'gosu'
require 'pry'

class AoC2015Day06Part01Visualization < Gosu::Window
  def initialize
    super 2000, 2000
    self.caption = "Tutorial Game"

    @tick_count = 0
    @input = File.open(File.join(File.dirname(__FILE__), 'input.txt')).read.split("\n")
    @grid = Array.new(1000) { Array.new(1000) { false } }

    @input.each do |command|
      op, x1, y1, x2, y2 = command.match(/(turn on|turn off|toggle)\s(\d+),(\d+)\sthrough\s(\d+),(\d+)/).captures
      
      (x1.to_i..x2.to_i).each do |x|
        (y1.to_i..y2.to_i).each do |y|
          @grid[x][y] = if op == 'turn on'
                         true
                       elsif op == 'turn off'
                         false
                       else
                         !@grid[x][y]
                       end
        end
      end
    end
  end
  
  def update

  end
  
  def draw
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        color = column ? Gosu::Color::WHITE : Gosu::Color::BLACK
        Gosu.draw_quad(row_index * 2, column_index  * 2, color, row_index * 2, (column_index + 1)  * 2, color, (row_index + 1)  * 2, column_index  * 2, color, (row_index + 1)  * 2, (column_index + 1)  * 2, color)
      end
    end
  end
end

# AoC2015Day06Part01Visualization.new.show # uncomment this if you want to see the visualization