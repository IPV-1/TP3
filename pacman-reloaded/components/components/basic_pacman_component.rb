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