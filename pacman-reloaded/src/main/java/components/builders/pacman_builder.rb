require_relative './components_builder'

class PacmanBuilder < ComponentsBuilder
  attr_accessor :appearance, :x, :y

  def with_block_position(x_block, y_block)
    self.x = x_block * self.config.get_int('blockSize')
    self.y = y_block * self.config.get_int('blockSize')
    self
  end

  def with_position(x,y)
    self.x = x
    self.y = y
    self
  end

  def with_appearance(appearance)
    self.appearance = appearance
    self
  end

  def build
    Pacman.new self.appearance, self.x, self.y
  end
end