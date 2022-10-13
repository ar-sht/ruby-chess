require_relative 'pieces'
require_relative 'tools'

class Board
  include Square

  def initialize
    @squares = Array.new(8) { Array.new(8) }
    populate_board
  end

  def print_board
    @squares.each do |row|
      row.each do |square|
        print square_string(square.color, square.icon)
      end
      puts
    end
  end
end
