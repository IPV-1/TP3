require 'java'

require_relative '../../components/resource/resource'
java_import Java::com.uqbar.vainilla.GameScene
java_import Java::com.uqbar.vainilla.GameComponent

class LoseScene < GameScene

  def onSetAsCurrent
    self.add_component GameComponent.new Resource.image('Game_Over2.png'), 0, 0
  end

end