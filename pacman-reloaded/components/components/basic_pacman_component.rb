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
    self.original_appearance = appearance
    shape.shapeable = self
    self.shape = shape
    initialize_vector x_vector, y_vector, speed
  end
end