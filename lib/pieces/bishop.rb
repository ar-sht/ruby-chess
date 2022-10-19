require_relative 'piece'

class Bishop < Piece
  transforms = []
  7.times do |i|
    i += 1
    to_prepend = [1, 1].map { |val| val * -1 * i }
    to_append = [1, 1].map { |val| val * i }
    transforms.prepend(to_prepend)
    transforms.append(to_append)
  end
  TRANSFORMS = transforms.freeze

  def initialize(position, color)
    @position = position
    @color = color
    @moves = []
    possible_moves
    super(@position, @moves, :bishop, @color)
  end

  def possible_moves
    TRANSFORMS.map { |t| [t[0] + @position[0], t[1] + @position[1]] }
              .select { |move| valid?(move) }
              .each { |move| @moves.append(move) }
  end
end
