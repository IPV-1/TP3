require 'java'
require '../map/color/color_parser'
require '../components/basic_pacman_component'

java_import Java::com.uqbar.vainilla.GameComponent
require_relative './pacman_scene'

class SceneBuilder
  attr_accessor :background, :walkable_matrix, :components, :config, :block_size, :pacman

  def initialize(config)
    self.config = config
    self.components = []
    self.block_size = config.get_int('blockSize')
  end

  def with_background(image)
    sprite = ColorParser::Parser.new(block_size).parse image
    self.background = GameComponent.new sprite, 0, 0
    self
  end

  def with_component(component)
    self.components << component
    self
  end

  def with_pacman(image, pacman_image)
    parser = ColorParser::Parser.new(block_size)
    parser.parse(image)
    position = parser.pacman_position
    shape = Circle.new ((block_size - 1) / 2), 0, 0
    self.pacman = Pacman.new(shape, pacman_image, position[0] * block_size, position[1] * block_size, 1, 0, 200)
    with_component pacman
    self
  end

  def with_walkable_matrix(image)
    parser = ColorParser::Parser.new(block_size)
    parser.parse(image)
    self.walkable_matrix = parser.walking_matrix
    self
  end

  def build
    scene = PacmanScene.new
    unless background.blank?
      scene.add_component background
    end
    unless walkable_matrix.blank?
      scene.walkable_matrix = walkable_matrix
    end
    scene.add_components components
    scene
  end
end