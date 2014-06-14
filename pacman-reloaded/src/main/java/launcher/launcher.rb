require 'java'
require '../config/app_config'
require '../pacman/pacman_game_builder'
require '../pacman/pacman_game'
require '../scenes/scene_builder'
require '../components/builders/pacman_builder'

java_import com.uqbar.vainilla.DesktopGameLauncher
java_import Java::extensions.shapes.Circle

c = AppConfig.new 'config/application.xml'
image = Resource.get_image 'pacman-min.png'
pacman = PacmanBuilder.new(c).with_appearance(image).with_block_position(0, 1).build
pacman.initialize_vector 1, 0, 200
pacman.shape = Circle.new image.width / 2 , 0, 0
pacman.shape.shapeable = pacman
pacman.block_size = c.get_int 'blockSize'
scene = SceneBuilder.new(c).with_background('img/map.png').with_walkable_matrix('img/map.png')
.with_component(pacman).build
game = PacmanGameBuilder.new.with_config(c).with_current_scene(scene).build

DesktopGameLauncher.new(game).launch