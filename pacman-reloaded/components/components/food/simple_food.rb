require 'java'

java_import Java::extensions.shapes.Shapeable
java_import Java::com.uqbar.vainilla.GameComponent

class SimpleFood < GameComponent
  include Shapeable
  attr_accessor :shape, :points
  def initialize(shape, appearance, x, y)
    super appearance, x, y
    shape.shapeable = self
    self.shape = shape
  end

  def eaten
    scene.points.add points
  end

  def points
    @points || 0
  end
end