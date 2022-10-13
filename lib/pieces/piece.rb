require_relative '../tools/square'
require_relative '../board'

class Piece
  include Square

  attr_reader :color
  attr_accessor :position, :moves, :type, :icon

  ICONS = {
    pawn: %W[\u2659 \u265F],
    knight: %W[\u2658 \u265E],
    bishop: %W[\u2657 \u265D],
    rook: %W[\u2656 \u265C],
    queen: %W[\u2655 \u265B],
    king: %W[\u2654 \u265A]
  }.freeze

  def initialize(position, moves, type, color)
    @position = position
    @moves = moves
    @type = type
    @color = color
    @icon = ICONS[@type][@color]
  end

  def print_piece(square_color)
    print square_string(square_color, icon)
  end

  def purge_move(move)
    @moves.delete(move)
  end
end

pawn = Piece.new([0, 0], [[0, 1], [0, 2]], :pawn, 0)
pawn.print_piece(1)

w_pawn = Piece.new([0, 0], [[0, 1], [0, 2]], :pawn, 1)
w_pawn.print_piece(0)
