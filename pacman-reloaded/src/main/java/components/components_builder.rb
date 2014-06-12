require_relative './pacman'

class ComponentsBuilder
  attr_accessor :config

  def initialize(config)
    self.config = config
  end

  def create_pacman(sprite, block_x, block_y)
    Pacman.new sprite, block_x * self.config.get_int('blockSize'), block_y * self.config.get_int('blockSize')
  end
end