require 'java'

require_relative '../../components/resource/resource'
java_import Java::com.uqbar.vainilla.GameScene
java_import Java::com.uqbar.vainilla.GameComponent

class LoseScene < GameScene

  def onSetAsCurrent
    self.add_component GameComponent.new game.resources['GameOver'], 0, 0
  end

end