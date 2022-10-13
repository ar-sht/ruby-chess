require_relative 'piece'

class Pawn < Piece

  TRANSFORMS = [
    [0, 1],
    [0, 2],
    [1, 1],
    [-1, 1]
  ].freeze

  def initialize(position, color)
    @moves = possible_moves
    super(position, @moves, :pawn, color)
  end

  def possible_moves
    moves = []
    moves.append(@position + TRANSFORMS[0])
    moves.append(@position + TRANSFORMS[1]) if starting_position?
    moves.append(@position + TRANSFORMS[2])
    moves.append(@position + TRANSFORMS[3])
    moves
  end

  def starting_position?
    @position[1] == (@color.zero? ? 1 : 6)
  end
end