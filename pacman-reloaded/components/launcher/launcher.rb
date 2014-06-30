#! jruby
require 'java'
require 'active_support/all'

require_relative '../config/app_config'
require_relative '../pacman/pacman_game_builder'
require_relative '../pacman/pacman_game'
require_relative '../scenes/scene_builder'

java_import com.uqbar.vainilla.DesktopGameLauncher

c = AppConfig.new 'config/application.xml'

#Take this to pacman game initialization
scene = SceneBuilder.new(c).from_image('img/map.png').build
game = PacmanGameBuilder.new(c).with_current_scene(scene).build

DesktopGameLauncher.new(game).launch