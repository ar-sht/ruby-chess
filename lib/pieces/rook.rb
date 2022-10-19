require_relative 'piece'

class Rook < Piece
  transforms = []
  7.times do |i|
    i += 1
    to_add = []
    to_add << [0, 1].map { |val| val * i }
    to_add << [0, 1].map { |val| val * -1 * i }
    to_add << [1, 0].map { |val| val * i }
    to_add << [1, 0].map { |val| val * -1 * i }
    to_add.each { |transform| transforms.append(transform) }
  end
  TRANSFORMS = transforms.freeze

  def initialize(position, color)
    @position = position
    @color = color
    @moves = []
    possible_moves
    super(@position, @moves, :rook, @color)
  end

  def possible_moves
    TRANSFORMS.map { |t| [t[0] + @position[0], t[1] + @position[1]] }
              .select { |move| valid?(move) }
              .each { |move| @moves.append(move) }
  end
end
