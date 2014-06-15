require 'java'
require 'active_support/all'

require '../config/app_config'
require '../pacman/pacman_game_builder'
require '../pacman/pacman_game'
require '../scenes/scene_builder'

java_import com.uqbar.vainilla.DesktopGameLauncher

c = AppConfig.new 'config/application.xml'

#Take this to pacman game initialization
scene = SceneBuilder.new(c).with_background('img/map.png').with_walkable_matrix('img/map.png').
    with_pacman('img/map.png', Resource.getImage(c['pacmanImg'])).build
game = PacmanGameBuilder.new(c).with_current_scene(scene).build

DesktopGameLauncher.new(game).launch