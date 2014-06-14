require_relative '../pacman'

class ComponentsBuilder
  attr_accessor :config

  def initialize(config)
    self.config = config
  end
end