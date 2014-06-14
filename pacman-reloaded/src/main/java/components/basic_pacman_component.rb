require 'java'
java_import Java::extensions.shapes.Shapeable
java_import Java::com.uqbar.vainilla.GameComponent

class BasicPacmanComponent < GameComponent
  include Shapeable
  attr_accessor :shape

  def initialize(shape, image, x, y)
    super(image, x, y)
    shape.shapeable = self
    self.shape = shape
  end
end