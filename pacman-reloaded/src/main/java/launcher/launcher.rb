require 'java'
require '../config/app_config'
require '../pacman/pacman_game_builder'
require '../pacman/pacman_game'
require '../scenes/scene_builder'
require '../components/pacman'

java_import com.uqbar.vainilla.DesktopGameLauncher
java_import Java::extensions.shapes.Circle

c = AppConfig.new 'config/application.xml'

block_size = c.get_int 'blockSize'

scene = SceneBuilder.new(c).with_background('img/map.png').with_walkable_matrix('img/map.png').with_block_size(block_size)
.build
game = PacmanGameBuilder.new(c).with_current_scene(scene).build

DesktopGameLauncher.new(game).launch