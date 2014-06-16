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
scene = SceneBuilder.new(c).with_background('img/map.png').with_walkable_matrix('img/map.png').
    with_pacman('img/map.png', Resource.image(c['pacmanImg'])).build
game = PacmanGameBuilder.new(c).with_current_scene(scene).build

DesktopGameLauncher.new(game).launch