require 'java'

java_import Java::com.uqbar.vainilla.events.constants.Key

class Mover

  def self.for(key, component)
    require_relative './right_mover'
    require_relative './down_mover'
    require_relative './left_mover'
    require_relative './up_mover'
    map = {
        Key::RIGHT => RightMover,
        Key::DOWN => DownMover,
        Key::UP => UpMover,
        Key::LEFT=> LeftMover
    }
    map[key].new component
  end

  def can_move?(delta_state, component)
    component.can_move? delta_state
  end

  def initialize(component)
    self.init_vector component
  end


end