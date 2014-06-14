require 'java'
java_import Java::com.uqbar.vainilla.GameScene
java_import Java::extensions.shapes.Circle
require '../pacman/pacman_game'


class PacmanScene < GameScene
  attr_accessor :walkable_matrix, :block_size

  def onSetAsCurrent
    super
    image = Resource.get_image 'pacman-min.png'
    shape = Circle.new image.width / 2, 0, 0
    pacman = Pacman.new(shape, image, 0 * block_size, 1 * block_size)
    pacman.initialize_vector 1, 0, 200
    add_component pacman
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

end
