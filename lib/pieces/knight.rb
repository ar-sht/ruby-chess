class Knight < Piece

  TRANSFORMS = [
    [1, 2],
    [-1, 2],
    [1, -2],
    [-1 -2],
    [2, 1],
    [-2, 1],
    [2, -1],
    [-2, -1]
  ].freeze

  def initialize(position, color)
    generate_possible_moves
    super(position, @moves, :knight, color)
  end

  def possible_moves
    TRANSFORMS.map { |t| [t[0] + position[0], t[1] + position[1]] }
              .select { valid?(move) }
              .each { |move| @moves.append(move) }
  end

  def valid?(move)
    move.all? { |coord| coord.between?(0, 7) }
  end
end
