require 'java'

java_import Java::com.uqbar.vainilla.GameComponent
java_import Java::java.awt.Font
java_import Java::com.uqbar.vainilla.appearances.Label


class Board < GameComponent
  attr_accessor :value, :changed

  def initialize(x, y, color)
    super Label.new(Font.new("verdana", Font::BOLD, 25), color, "0"), x, y
    self.z = 100
    self.value = 0
  end

  def add(new_value)
    self.value += new_value
  end

  def reset
    self.value = 0
  end


  def update(delta_state)
    if changed
      self.appearance.text = self.label
      self.changed = false
    end
    super
  end

  def label
    value.to_s
  end

  def value=(value)
    self.changed = true
    @value = value
  end
end