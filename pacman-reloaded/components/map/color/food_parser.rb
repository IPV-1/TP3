require 'java'

require 'active_support/concern'
require_relative '../../../components/components/food/simple_food'
java_import Java::java.awt.Color
java_import Java::java.awt.image.BufferedImage
java_import Java::com.uqbar.vainilla.appearances.Sprite
java_import Java::extensions.shapes.Circle

module ColorParser
  module FoodParser
    extend ActiveSupport::Concern

    included do
      attr_accessor :foods
    end

    def create_food(file)
      self.foods = []
      read_image(file) do |image, width, height|
        (0...height).each do |row_number|
          create_foods_row(row_number, width, image)
        end
      end
      foods
    end

    def create_foods_row(row_number, width, image)
      (0...width).each do |column_number|
        pixel = image.getRGB(column_number, row_number)
        if food? pixel
          foods << SimpleFood.new(Circle.new(food_ratio, 0, 0), com.uqbar.vainilla.appearances.Circle.new(Color::YELLOW, food_ratio), centre(column_number), centre(row_number))
        end
      end
    end

    def centre(position)
      position * block_size + (block_size / 2) - food_ratio / 2
    end

    def food?(pixel)
      pixel == Color::darkGray.get_rgb
    end

    def food_ratio
      block_size / 2
    end


  end
end