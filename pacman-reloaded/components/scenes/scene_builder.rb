require 'java'
require '../map/color/color_parser'
require '../components/basic_pacman_component'

java_import Java::com.uqbar.vainilla.GameComponent
require_relative './pacman_scene'

class SceneBuilder
  attr_accessor :ghosts, :background, :walkable_matrix, :components, :config, :block_size, :pacman, :init_lifes, :foods

  def initialize(config)
    self.config = config
    self.components = []
    self.block_size = config.get_int('blockSize')
  end

  def from_image(image_file)
    parser = ColorParser::Parser.new(block_size)
    parser.parse image_file
    with_background(parser)
    with_walkable_matrix(parser)
    with_pacman parser, game.resources['pacman-img']
    with_food(parser)
    with_ghosts(parser)
  end

  def with_background(parser)
    self.background = GameComponent.new parser.background, 0, 0
    self
  end

  def with_component(component)
    self.components << component
    self
  end

  def with_components(components)
    components.each { |component| self.with_component component }
    self
  end

  def with_pacman(parser, pacman_image)
    position = parser.pacman_position
    shape = Circle.new ((block_size - 1) / 2), 0, 0
    self.pacman = PacmanComponent.new(shape, pacman_image, position[0] * block_size, position[1] * block_size, 1, 0, 150)
    with_component pacman
    self
  end

  def with_ghosts(parser)
    self.ghosts = parser.ghosts
    with_components ghosts
    self
  end

  def with_food(parser)
    self.foods = parser.foods
    with_components foods
    self
  end

  def with_init_lifes(init_lifes)
    self.init_lifes = init_lifes
  end

  def with_walkable_matrix(parser)
    self.walkable_matrix = parser.walking_matrix
    self
  end

  def build
    scene = PacmanScene.new
    scene.lifes.value = init_lifes || 3
    unless background.blank?
      scene.add_component background
    end
    unless walkable_matrix.blank?
      scene.walkable_matrix = walkable_matrix
    end
    scene.add_components components
    scene.foods = foods
    scene.ghosts = ghosts
    scene.pacman = pacman
    scene
  end
end