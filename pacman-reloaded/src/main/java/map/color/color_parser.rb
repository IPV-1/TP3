require 'java'
require_relative './background_parser'
java_import Java::resource.Resource
java_import Java::javax.imageio.ImageIO
java_import Java::java.awt.image.BufferedImage
java_import Java::com.uqbar.vainilla.appearances.Sprite
java_import Java::java.awt.Color

module ColorParser
  class Parser
    include ColorParser::BackgroundParser
    attr_accessor :walking_matrix, :block_size

    def initialize(block_size)
      self.block_size = block_size
      self.walking_matrix = []
    end

    def parse(file)
      super
      create_walking_matrix(file)
      self.background
    end

    def create_walking_matrix(file)
      read_image(file) do |image, w, h|
        (0...h).each do |i|
          create_row(i, w, image)
        end
      end
    end

    def read_image(file)
      stream = Resource.getResourceAsStream file
      image = ImageIO.read stream
      w = image.width
      h = image.height
      yield image, w, h
    end

    private

    def create_row(i, width, image)
      row = []
      (0...width).each do |j|
        pixel = image.getRGB(j, i)
        row << boolean_for(pixel)
      end
      add_row row
    end

    def add_row(row)
      walking_matrix << row
    end


    def boolean_for(color)
      color != -324853
    end
  end
end