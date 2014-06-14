java_import Java::com.uqbar.vainilla.GameScene

require '../pacman/pacman_game'


class AbstractPacmanScene < GameScene

  attr_accessor :walkable_matrix, :block_size

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

end
