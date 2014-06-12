require 'java'

java_import Java::pacman.PacmanGame


class PacmanGameBuilder
  attr_accessor :config_file

  def with_config(config_file)
    self.config_file = config_file
    self
  end

  def build
    PacmanGame.new config_file
  end
end