require 'java'
require '../map/color_parser'
require '../components/basic_pacman_component'

java_import Java::scenes.AbstractPacmanScene

class SceneBuilder
  attr_accessor :background

  def with_background(image)
    sprite = ColorParser.new.parse image
    self.background = BasicPacmanComponent.new sprite, 0, 0
    self
  end

  def build
    scene = AbstractPacmanScene.new
    unless background.nil?
      scene.add_component background
    end
    scene
  end
end