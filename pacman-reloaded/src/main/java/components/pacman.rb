require 'java'

java_import Java::extensions.shapes.Shapeable
require_relative './mixins/movable'
require_relative './mixins/handleable'
class Pacman < BasicPacmanComponent
  include Movable
  include Handleable
  include Shapeable
  attr_accessor :shape, :block_size

  def update(delta_state)
    update_vector delta_state, uVector
    if can_move? delta_state
      move(delta_state)
    end
    super
  end

  def can_move?(delta_state)
    x, y = shape.x, shape.y
    new_x = calculate_position x, uVector.x, speed_factor(delta_state)
    new_y = calculate_position y, uVector.y, speed_factor(delta_state)
    can_occupy?(new_x, new_y)
  end

  def can_occupy?(x, y)
    scene.can_walk to_b(x), to_b(y) and
        scene.can_walk to_b(x + shape.diameter), to_b(y) and
        scene.can_walk to_b(x), to_b(y + shape.diameter) and
        scene.can_walk to_b(x + shape.diameter), to_b(y + shape.diameter)

  end
  def to_b(x)
    (x / block_size).to_i
  end

  java_signature 'double getX()'
  def getX
    super
  end

  java_signature 'double getY()'
  def getY
    super
  end
end