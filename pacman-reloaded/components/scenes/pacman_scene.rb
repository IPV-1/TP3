require 'java'
java_import Java::com.uqbar.vainilla.GameScene
java_import Java::extensions.shapes.Circle

require_relative '../components/pacman_component'


class PacmanScene < GameScene
  attr_accessor :walkable_matrix, :pacman

  def onSetAsCurrent
    super
  end

  def can_walk(x, y)
    walkable_matrix[y][x]
  end

  def can_occupy?(x, y, circle)
    can_walk to_b(x), to_b(y) and
        can_walk to_b(x + circle.diameter), to_b(y) and
        can_walk to_b(x), to_b(y + circle.diameter) and
        can_walk to_b(x + circle.diameter), to_b(y + circle.diameter)

  end

  def to_b(x)
    (x / block_size).to_i
  end

  def block_size
    game.block_size
  end

end
