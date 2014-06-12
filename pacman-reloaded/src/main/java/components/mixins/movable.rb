require 'java'

java_import Java::com.uqbar.vainilla.UnitVector2D

module Movable
  attr_accessor :uVector, :speed

  def initialize_vector(xVec, yVec, speed)
    self.uVector = UnitVector2D.new(xVec, yVec)
    self.speed = speed
  end

  def move(delta_state)
    self.x = move_position x, uVector.x, speed_factor(delta_state)
    self.y = move_position y, uVector.y, speed_factor(delta_state)
  end

  def move_position(position, uVectorProportion, speedFactor)
    position + uVectorProportion * speedFactor
  end

  def speed_factor(delta_state)
    speed * delta_state.delta
  end
end