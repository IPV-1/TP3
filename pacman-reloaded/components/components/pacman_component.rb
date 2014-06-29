require 'java'
require_relative './movers/right_mover'
require_relative './mixins/handleable'
require_relative './mixins/appearance_rotable'
class PacmanComponent < BasicPacmanComponent
  include Handleable
  include AppearanceRotable

  def update(delta_state)
    fix_position
    update_vector delta_state, uVector
    if can_move? delta_state
      move(delta_state)
    end
    mover.rotare_appearance self
    super
  end

  def fix_position
    if x < 0
      self.x = scene.game.display_size.width - 1
    end
    if x > scene.game.display_size.width
      self.x = 0
    end
    if y < 0
      self.y = scene.game.display_size.height - 1
    end
    if y > scene.game.display_size.height
      self.y = 0
    end
  end

  def can_move?(delta_state)
    x, y = shape.x, shape.y
    new_x = calculate_position x, uVector.x, speed_factor(delta_state)
    new_y = calculate_position y, uVector.y, speed_factor(delta_state)
    scene.can_occupy?(new_x, new_y, shape)
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