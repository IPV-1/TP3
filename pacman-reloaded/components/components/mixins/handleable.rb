require 'java'

java_import Java::com.uqbar.vainilla.events.constants.Key

module Handleable
  def update_vector(delta_state, vector)
    old_y = vector.y
    old_x = vector.x
    if delta_state.key_pressed? Key::UP
      vector.y = -1
      vector.x = 0
    end
    if delta_state.key_pressed? Key::DOWN
      vector.y = 1
      vector.x = 0
    end
    if delta_state.key_pressed? Key::RIGHT
      vector.x = 1
      vector.y = 0
    end
    if delta_state.key_pressed? Key::LEFT
      vector.x = -1
      vector.y = 0
    end
    unless can_move? delta_state
      if old_y == 0
        vector.x = old_x
        vector.y = old_y
      else
        vector.y = old_y
        vector.x = old_x
      end


    end
  end
end