require 'java'
java_import Java::config.Config
require '../pacman/pacman_game_builder'
require '../scenes/scene_builder'
require '../components/components_builder'

java_import com.uqbar.vainilla.DesktopGameLauncher
java_import Java::pacman.PacmanGame

c = Config.new 'application.xml'
image = Resource.get_image 'pacman-min.png'
pacman = ComponentsBuilder.new(c).create_pacman(image, 0, 1)
pacman.initialize_vector 1, 0, 200
scene = SceneBuilder.new(c).with_background('img/map.png').with_walkable_matrix('img/map.png')
.with_component(pacman).build
game = PacmanGameBuilder.new.with_config(c).with_current_scene(scene).build

DesktopGameLauncher.new(game).launch