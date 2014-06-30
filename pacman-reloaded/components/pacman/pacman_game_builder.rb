require 'java'

require '../pacman/pacman_game'


#Ensure correct initialization of PacmanGame
class PacmanGameBuilder
  attr_accessor :config_obj, :scene

  def initialize(config)
    self.config_obj = config
  end

  def with_current_scene(scene)
    self.scene = scene
    self
  end

  def build
    game = PacmanGame.new
    game.init
    game.init_config config_obj
    unless scene.nil?
      game.set_current_scene scene
    end
    game
  end
end