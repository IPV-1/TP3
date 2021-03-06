require 'java'

require_relative './background_parser'
require_relative './walking_matrix_parser'
require_relative './pacman_loader'
require_relative './food_parser'
require_relative './ghosts_parser'

require_relative '../../resource/resource'
java_import Java::javax.imageio.ImageIO
java_import Java::java.awt.image.BufferedImage
java_import Java::com.uqbar.vainilla.appearances.Sprite
java_import Java::java.awt.Color

module ColorParser
  class Parser
    include ColorParser::BackgroundParser
    include ColorParser::FoodParser
    include ColorParser::WalkingMatrixParser
    include ColorParser::PacmanLoader
    include ColorParser::GhostsParser
    attr_accessor :block_size

    def initialize(block_size)
      self.block_size = block_size
      self.walking_matrix = []
    end

    def parse(file)
      create_position file
      create_background file
      create_walking_matrix file
      create_food file
      create_ghosts file
      self.background
    end

    def read_image(file)
      stream = Resource.resource_as_stream file
      image = ImageIO.read stream
      w = image.width
      h = image.height
      yield image, w, h
      stream.close
    end

  end
end