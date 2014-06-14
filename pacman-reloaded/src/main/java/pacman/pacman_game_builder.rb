require 'java'

require '../pacman/pacman_game'


class PacmanGameBuilder
  attr_accessor :config_obj, :scene

  def with_config(config_obj)
    self.config_obj = config_obj
    self
  end

  def with_current_scene(scene)
    self.scene = scene
    self
  end

  def build
    game = PacmanGame.new
    game.init_config config_obj
    unless scene.nil?
      game.set_current_scene scene
    end
    game
  end
end