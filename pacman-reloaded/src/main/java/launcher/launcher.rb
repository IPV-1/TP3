require 'java'

require '../pacman/pacman_game_builder'
require '../scenes/scene_builder'
require '../components/components_builder'

java_import com.uqbar.vainilla.DesktopGameLauncher
java_import Java::pacman.PacmanGame

image = Resource.get_image 'pacman-min.png'
pacman = ComponentsBuilder.new.create_pacman(image)
scene = SceneBuilder.new.with_background('img/map.png').with_walkable_matrix('img/map.png')
.with_component(pacman).build
game = PacmanGameBuilder.new.with_config('application.xml').with_current_scene(scene).build

DesktopGameLauncher.new(game).launch