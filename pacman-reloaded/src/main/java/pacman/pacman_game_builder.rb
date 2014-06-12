require 'java'

java_import Java::pacman.PacmanGame


class PacmanGameBuilder
  attr_accessor :config_file, :scene

  def with_config(config_file)
    self.config_file = config_file
    self
  end

  def with_current_scene(scene)
    self.scene = scene
    self
  end

  def build
    game = PacmanGame.new config_file
    unless scene.nil?
      game.set_current_scene scene
    end
    game
  end
end