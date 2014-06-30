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
    can_move_to? uVector.x, uVector.y, delta_state
  end

  def can_move_to_left?(delta_state)
    can_move_to? -1, 0, delta_state
  end

  def can_move_to_right?(delta_state)
    can_move_to? 1, 0, delta_state
  end

  def can_move_to_above?(delta_state)
    can_move_to? 0, -1, delta_state
  end

  def can_move_to_below?(delta_state)
    can_move_to? 0, 1, delta_state
  end

  def can_move_to?(x_v, y_v, delta_state)
    x = calculate_position shape.x, x_v, speed_factor(delta_state)
    y = calculate_position shape.y, y_v, speed_factor(delta_state)
    scene.can_occupy?(x, y, shape)
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