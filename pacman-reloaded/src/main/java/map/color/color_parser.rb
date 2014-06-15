require 'java'

require_relative './background_parser'
require_relative './walking_matrix_parser'

java_import Java::resource.Resource
java_import Java::javax.imageio.ImageIO
java_import Java::java.awt.image.BufferedImage
java_import Java::com.uqbar.vainilla.appearances.Sprite
java_import Java::java.awt.Color

module ColorParser
  class Parser
    include ColorParser::BackgroundParser
    include ColorParser::WalkingMatrixParser
    attr_accessor :block_size

    def initialize(block_size)
      self.block_size = block_size
      self.walking_matrix = []
    end

    def parse(file)
      create_background file
      create_walking_matrix file
      self.background
    end

    def read_image(file)
      stream = Resource.getResourceAsStream file
      image = ImageIO.read stream
      w = image.width
      h = image.height
      yield image, w, h
    end

  end
end