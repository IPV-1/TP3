require 'java'

require '../pacman/pacman_game_builder'

java_import com.uqbar.vainilla.DesktopGameLauncher
java_import Java::pacman.PacmanGame

game = PacmanGameBuilder.new.with_config('application.xml').build

DesktopGameLauncher.new(game).launch