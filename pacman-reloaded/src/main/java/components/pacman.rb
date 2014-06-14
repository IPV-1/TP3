require 'java'

require_relative './mixins/handleable'
class Pacman < BasicPacmanComponent
  include Handleable

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
    scene.can_occupy?(new_x, new_y, shape)
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