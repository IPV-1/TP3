require_relative '../basic_pacman_component'
require_relative './simple_movement'

class Ghost < BasicPacmanComponent
  attr_accessor :mover

  def initialize(shape, appearance, x, y, x_vector, y_vector, speed)
    super
    self.mover = SimpleMovement.new
  end


  def update(delta_state)
    fix_position
    if can_move? delta_state
      mover.move(self, delta_state)
    else
      mover.rotate self
    end
  end


end