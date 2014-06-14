require 'java'

require '../config/app_config'
require '../config/configured_resources'

java_import Java::com.uqbar.vainilla.Game

java_import java.awt.Dimension

class PacmanGame < Game
  attr_accessor :config, :resources, :display_size

  def init_config(config)
    self.config = config
    self.resources = ConfiguredResources.new config
    initialize_config_resources
  end

  def  initialize_config_resources
    resources.load_sprite('map')
    self.display_size = Dimension.new resources.get_int('screenWidth'), resources.get_int('screenHeight')
  end

  java_signature 'void initializeResources()'
  def initializeResources
    #initialize resources that do not depends on configurations
  end

  java_signature 'void setUpScenes()'
  def setUpScenes
    #initialize scenes that do not depends on configurations
  end

  java_signature 'void getDisplaySize()'
  def getDisplaySize
    self.display_size
  end

  java_signature 'void getTile()'
  def getTitle
    'Pacman reloaded'
  end

end