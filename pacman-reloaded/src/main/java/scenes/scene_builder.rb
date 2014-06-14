require 'java'
require '../map/color_parser'
require '../components/basic_pacman_component'

java_import Java::com.uqbar.vainilla.GameComponent
require_relative './abstract_pacman_scene'

class SceneBuilder
  attr_accessor :background, :walkable_matrix, :components, :config, :block_size

  def initialize(config)
    self.config =config
    self.components = []
  end

  def with_background(image)
    sprite = ColorParser.new(self.config.get_int('blockSize')).parse image
    self.background = GameComponent.new sprite, 0, 0
    self
  end

  def with_component(component)
    self.components << component
    self
  end

  def with_walkable_matrix(image)
    parser = ColorParser.new(self.config.get_int('blockSize'))
    parser.parse(image)
    self.walkable_matrix = parser.get_walking_matrix
    self
  end

  def with_block_size(block_size)
    self.block_size = block_size
    self
  end

  def build
    scene = AbstractPacmanScene.new
    unless background.nil?
      scene.add_component background
    end
    unless walkable_matrix.nil?
      scene.walkable_matrix = walkable_matrix
    end
    scene.block_size = block_size
    scene.add_components components

    scene
  end
end