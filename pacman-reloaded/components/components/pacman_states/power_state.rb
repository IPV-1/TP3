require_relative './simple_state'
require_relative '../timer/timer'
class PowerState
  attr_accessor :timer, :appearance
  def initialize(limit, appearance)
    self.appearance = appearance
    self.timer = Timer.new limit
  end

  def update(pacman, delta_state)
    timer.update pacman, delta_state do |pacman, delta_state|
      pacman.simple_state!
    end

  end

  def collides_with(pacman, ghost, scene_lifes)
    ghost.destroy
    pacman.scene.ghosts.delete ghost
  end


end