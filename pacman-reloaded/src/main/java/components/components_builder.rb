require_relative './pacman'

class ComponentsBuilder
  attr_accessor :config

  def initialize(config)
    self.config = config
  end

  def create_pacman(sprite, blockX, blockY)
    Pacman.new sprite, blockX * self.config.get_int('blockSize'), blockY * self.config.get_int('blockSize')
  end
end