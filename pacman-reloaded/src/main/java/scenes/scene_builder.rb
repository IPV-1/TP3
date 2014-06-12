require 'java'
require '../map/color_parser'
require '../components/basic_pacman_component'

java_import Java::scenes.AbstractPacmanScene

class SceneBuilder
  attr_accessor :background, :walkable_matrix, :components

  def initialize
    self.components = []
  end

  def with_background(image)
    sprite = ColorParser.new.parse image
    self.background = BasicPacmanComponent.new sprite, 0, 0
    self
  end

  def with_component(component)
    self.components << component
    self
  end

  def with_walkable_matrix(image)
    parser = ColorParser.new
    parser.parse(image)
    self.walkable_matrix = parser.get_walking_matrix
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
    scene.add_components components

    scene
  end
end