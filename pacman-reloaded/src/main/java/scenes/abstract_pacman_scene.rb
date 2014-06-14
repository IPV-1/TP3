java_import Java::com.uqbar.vainilla.GameScene

require '../pacman/pacman_game'


class AbstractPacmanScene < GameScene

  attr_accessor :walkable_matrix

  def can_walk(x, y)
    walkable_matrix[y][x]
  end

end
