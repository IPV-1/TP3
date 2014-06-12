require_relative './mixins/movable'
class Pacman < BasicPacmanComponent
  include Movable

  def update(delta_state)
    move(delta_state)
    super
  end
end