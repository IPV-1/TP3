require 'java'

java_import Java::com.uqbar.vainilla.events.constants.Key

module Handleable
  def update_vector(delta_state, vector)
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
  end
end