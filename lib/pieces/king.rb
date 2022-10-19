require_relative 'piece'

class King < Piece
  TRANSFORMS = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0],
    [1, 1],
    [-1, -1]
  ].freeze

  def initialize(position, color)
    @position = position
    @color = color
    @moves = []
    possible_moves
    super(@position, @moves, :pawn, @color)
  end

  def possible_moves
    @moves = []
    TRANSFORMS.map { |t| [t[0] + @position[0], t[1] + @position[1]] }
              .select { |move| valid?(move) }
              .each { |move| @moves.append(move) }
  end
end
