require 'java'
require_relative './movers/right_mover'
require_relative './mixins/handleable'
require_relative './mixins/appearance_rotable'
require_relative './pacman_states/simple_state'
require_relative './pacman_states/power_state'
class PacmanComponent < BasicPacmanComponent
  include Handleable
  include AppearanceRotable
  attr_accessor :state

  def initialize(s, a, x, y, x_v, y_v, speed)
    super
    self.state = SimpleState.new
    self.original_appearance = appearance
  end

  def power!
    self.state = PowerState.new 5
  end

  def update(delta_state)
    state.update self, delta_state
    update_vector delta_state, uVector
    if can_move? delta_state
      move(delta_state)
    end
    mover.rotare_appearance self
    super
  end

  def collides_with(ghost, scene_lifes)
      self.state.collides_with(self, ghost, scene_lifes)

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