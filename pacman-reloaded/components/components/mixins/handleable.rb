require 'java'

java_import Java::com.uqbar.vainilla.events.constants.Key
require 'active_support/concern'
require_relative '../movers/mover'

module Handleable
  extend ActiveSupport::Concern
  included do
    attr_accessor :mover
  end

  def is_pressing(delta_state, key)
    delta_state.key_being_hold?(key) or delta_state.key_pressed?(key)
  end

  def update_vector(delta_state, vector)
    unless mover
      self.mover = Mover.for Key::RIGHT, self
    end
    old_mover = self.mover
    if is_pressing delta_state, Key::UP
      self.mover = Mover.for Key::UP, self
    end
    if is_pressing delta_state, Key::DOWN
      self.mover = Mover.for Key::DOWN, self
    end
    if is_pressing delta_state, Key::RIGHT
      self.mover = Mover.for Key::RIGHT, self
    end
    if is_pressing delta_state, Key::LEFT
      self.mover = Mover.for Key::LEFT, self
    end
    unless mover.can_move? delta_state, self
      old_mover.init_vector self
      self.mover = old_mover
    end
  end
end