require_relative 'piece'

class Knight < Piece

  TRANSFORMS = [
    [1, 2],
    [-1, 2],
    [1, -2],
    [-1, -2],
    [2, 1],
    [-2, 1],
    [2, -1],
    [-2, -1]
  ].freeze

  def initialize(position, color)
    @position = position
    @color = color
    @moves = []
    possible_moves
    super(@position, @moves, :knight, @color)
  end

  def possible_moves
    TRANSFORMS.map { |t| [t[0] + @position[0], t[1] + @position[1]] }
              .select { |move| valid?(move) }
              .each { |move| @moves.append(move) }
  end
end
