require 'java'
require_relative './movers/right_mover'
require_relative './mixins/handleable'
require_relative './mixins/appearance_rotable'
class PacmanComponent < BasicPacmanComponent
  include Handleable
  include AppearanceRotable

  def initialize(s, a, x, y, x_v, y_v, speed)
    super
    self.original_appearance = appearance
  end

  def update(delta_state)
    update_vector delta_state, uVector
    if can_move? delta_state
      move(delta_state)
    end
    mover.rotare_appearance self
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