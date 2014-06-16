require 'java'
require 'active_support/concern'
java_import Java::java.awt.Color
java_import Java::java.awt.image.BufferedImage
java_import Java::com.uqbar.vainilla.appearances.Sprite

module ColorParser
  module PacmanLoader

    extend ActiveSupport::Concern

    included do
      attr_accessor :pacman_position
    end

    def create_position(file)
      read_image(file) do |image, width, height|
        (0...height).each do |row_number|
          find_position(image, row_number, width)
        end
      end
      if pacman_position.blank?
        raise "Could find pacman position in #{file}"
      end
    end

    def find_position(image, row_number, width)
      (0...width).each do |column_number|
        pixel = image.getRGB(column_number, row_number)
        if is_pacman? pixel
          self.pacman_position = [column_number, row_number]
        end
      end
    end

    def is_pacman?(pixel)
      -277237 == pixel
    end

  end
end