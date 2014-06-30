require 'java'

require_relative './mixins/movable'
java_import Java::extensions.shapes.Shapeable
java_import Java::com.uqbar.vainilla.GameComponent

class BasicPacmanComponent < GameComponent
  include Movable
  include Shapeable
  attr_accessor :shape
  def initialize(shape, appearance, x, y, x_vector, y_vector, speed)
    super appearance, x, y
    shape.shapeable = self
    self.shape = shape
    initialize_vector x_vector, y_vector, speed
  end

  def can_move?(delta_state)
    x, y = shape.x, shape.y
    new_x = calculate_position x, uVector.x, speed_factor(delta_state)
    new_y = calculate_position y, uVector.y, speed_factor(delta_state)
    scene.can_occupy?(new_x, new_y, shape)
  end

  def update(delta_state)
    fix_position
    super
  end

  def fix_position
    if x < 0
      self.x = scene.game.display_size.width - 1
    end
    if x > scene.game.display_size.width
      self.x = 0
    end
    if y < 0
      self.y = scene.game.display_size.height - 1
    end
    if y > scene.game.display_size.height
      self.y = 0
    end
  end
end