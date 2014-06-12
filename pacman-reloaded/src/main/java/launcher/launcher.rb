require 'java'

require '../pacman/pacman_game_builder'
require '../scenes/scene_builder'

java_import com.uqbar.vainilla.DesktopGameLauncher
java_import Java::pacman.PacmanGame

scene = SceneBuilder.new.with_background('img/map.png').build
game = PacmanGameBuilder.new.with_config('application.xml').with_current_scene(scene).build

DesktopGameLauncher.new(game).launch