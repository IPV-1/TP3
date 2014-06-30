require 'java'
require 'active_support/concern'
require_relative '../../../components/resource/resource'
require_relative '../../../components/components/ghosts/ghost'
java_import Java::java.awt.Color
module ColorParser
  module GhostsParser
    extend ActiveSupport::Concern
    included do
      attr_accessor :ghosts
    end

    def create_ghosts(file)
      self.ghosts = []
      read_image(file) do |image, width, height|
        (0...height).each do |row_number|
          create_ghosts_row(row_number, width, image)
        end
      end
      ghosts
    end

    def create_ghosts_row(row_number, width, image)
      (0...width).each do |column_number|
        pixel = image.getRGB(column_number, row_number)
        if ghost? pixel
          shape = Circle.new ((block_size - 1) / 2), 0, 0
          g = Ghost.new(shape, ghost_image_for(pixel), column_number * block_size, row_number * block_size, 1, 0, 150)

          ghosts << g
        end
      end
    end

    def ghost?(pixel)
      colors = []
      colors << -16046085
      colors << -14550261
      colors << -787701
      colors << -324638
      colors.include? pixel
    end

    def ghost_image_for(pixel)
      gs = {}
      gs[-16046085] = Resource.image 'ghosts/blinky-min.png'
      gs[-14550261] = Resource.image 'ghosts/clyde-min.png'
      gs[-787701] = Resource.image 'ghosts/inky-min.png'
      gs[-324638 ] = Resource.image 'ghosts/pinky-min.png'
      gs[pixel]
    end
  end
end