require 'colorize'
module Square
  def square_string(color, piece)
    color.zero? ? " #{piece} ".colorize(background: :white) : " #{piece} ".colorize(background: :light_black)
  end
end
