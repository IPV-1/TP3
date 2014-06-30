require 'java'

require 'active_support/concern'
require_relative '../../../components/components/food/simple_food'
require_relative '../../../components/components/food/power_food'
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
          food = food_for pixel, column_number, row_number
          foods << food
        end
      end
    end

    def centre(position, diameter)
      position * block_size + (block_size / 2) - diameter / 2
    end

    def food?(pixel)
      [Color::darkGray.get_rgb, Color::black.get_rgb].include? pixel
    end

    def food_for(pixel, column_number, row_number)
      if pixel == Color::darkGray.get_rgb
        shape = Circle.new(food_diameter/2, 0, 0)
        food = SimpleFood.new(shape, com.uqbar.vainilla.appearances.Circle.new(Color::YELLOW, food_diameter), centre(column_number, shape.diameter), centre(row_number, shape.diameter))
        food.points = 10
        return food
      end
      if pixel == Color::black.get_rgb
        shape = Circle.new(food_diameter/2*2/3*2, 0, 0)
        food = PowerFood.new(shape, com.uqbar.vainilla.appearances.Circle.new(Color::PINK, food_diameter*2/3*2), centre(column_number, shape.diameter), centre(row_number, shape.diameter))
        food.points = 20
        return food
      end
    end

    def food_diameter
      block_size / 2
    end


  end
end