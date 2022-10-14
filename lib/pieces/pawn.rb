require_relative 'piece'

class Pawn < Piece

  TRANSFORMS = [
    [0, 1],
    [0, 2],
    [1, 1],
    [-1, 1]
  ].freeze

  def initialize(position, color)
    generate_possible_moves
    super(position, @moves, :pawn, color)
  end

  def generate_possible_moves
    @moves = []
    TRANSFORMS.map { |t| [t[0] + position[0], t[1] + position[1]] }
              .select { |move| valid?(move) }
              .each { |move| @moves.append(move) }

    purge_move(position + TRANSFORMS[1]) unless starting_position?
  end

  def starting_position?
    @position[1] == (@color.zero? ? 1 : 6)
  end

  def valid?(move)
    move.all? { |coord| coord.between?(0, 7) }
  end
end
