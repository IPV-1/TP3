require 'java'

java_import Java::extensions.shapes.Shapeable
require_relative './mixins/movable'
class Pacman < BasicPacmanComponent
  include Movable
  include Shapeable
  attr_accessor :shape

  def update(delta_state)
    move(delta_state)
    super
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