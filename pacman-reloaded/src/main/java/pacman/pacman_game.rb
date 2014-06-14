java_import Java::com.uqbar.vainilla.Game
java_import Java::config.Config
java_import Java::config.ConfiguredResources

java_import java.awt.Dimension

class PacmanGame < Game
  attr_accessor :config, :resources, :display_size

  def init_config(config)
    self.config = config
    self.resources = ConfiguredResources.new config
    initialize_config_resources
  end

  def  initialize_config_resources
    resources.loadSprite('map')
    self.display_size = Dimension.new resources.getInt('screenWidth'), resources.getInt('screenHeight')
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