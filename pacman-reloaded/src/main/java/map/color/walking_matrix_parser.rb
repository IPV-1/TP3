require 'active_support/concern'

module ColorParser
  module WalkingMatrixParser
    extend ActiveSupport::Concern
    included do
      attr_accessor :walking_matrix
    end

    def create_walking_matrix(file)
      read_image(file) do |image, w, h|
        (0...h).each do |i|
          create_row(i, w, image)
        end
      end
    end

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