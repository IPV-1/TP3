require 'java'
require '../map/color_parser'
require '../components/basic_pacman_component'

java_import Java::com.uqbar.vainilla.GameComponent
require_relative './pacman_scene'

class SceneBuilder
  attr_accessor :background, :walkable_matrix, :components, :config, :block_size

  def initialize(config)
    self.config = config
    self.components = []
    self.block_size = config.get_int('blockSize')
  end

  def with_background(image)
    sprite = ColorParser.new(block_size).parse image
    self.background = GameComponent.new sprite, 0, 0
    self
  end

  def with_component(component)
    self.components << component
    self
  end

  def with_walkable_matrix(image)
    parser = ColorParser.new(block_size)
    parser.parse(image)
    self.walkable_matrix = parser.get_walking_matrix
    self
  end

  def build
    scene = PacmanScene.new
    unless background.nil?
      scene.add_component background
    end
    unless walkable_matrix.nil?
      scene.walkable_matrix = walkable_matrix
    end
    scene.add_components components
    scene
  end
end