require 'java'

java_import Java::resource::Resource
java_import Java::javax.imageio.ImageIO
java_import Java::java.awt.image.BufferedImage
java_import Java::com.uqbar.vainilla.appearances.Sprite
java_import Java::java.awt.Color

class ColorParser
  attr_accessor :walking_matrix, :background

  #Remove this!
  BLOCK_SIZE = 30

  def initialize
    self.walking_matrix = []
  end

  def parse(file)
    create_walking_matrix(file)
    create_background(file)
  end

  def create_background(file)
    read_image(file) do |image,width, height|
      new_image = BufferedImage.new width * BLOCK_SIZE, height * BLOCK_SIZE, BufferedImage::TYPE_INT_ARGB
      graphics = new_image.createGraphics
      (0...height).each do |row_number|
        create_image_row(row_number, width, image, graphics)
      end
      graphics.dispose
      Sprite.new new_image
    end
  end

  def create_walking_matrix(file)
    read_image(file) do |image,w, h|
      (0...h).each do |i|
        create_row(i, w, image)
      end
    end
  end

  def read_image(file)
    stream = Resource.java_class.resource file
    image = ImageIO.read stream
    w = image.width
    h = image.height
    yield image, w, h
  end

  private

  def create_image_row(row_number, width, image, graphics)
    (0...width).each do |column_number|
      pixel = image.getRGB(column_number, row_number)
      g_image = image_for(pixel, image)
      graphics.draw_image(g_image, nil, column_number* BLOCK_SIZE, row_number * BLOCK_SIZE)
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
    color == -324853
  end

  def image_for(color, image)
    new_image = BufferedImage.new BLOCK_SIZE, BLOCK_SIZE, BufferedImage::TYPE_INT_ARGB
    graphics = new_image.createGraphics
    graphics.color = (color == -324853 ? Color::RED : Color::BLUE)
    graphics.fill_rect( 0, 0, BLOCK_SIZE, BLOCK_SIZE)
    graphics.dispose
    new_image
  end
end


c = ColorParser.new
a = c.parse 'img/map.png'
puts c.walking_matrix.size
outputfile = java.io.File.new('image.png')
ImageIO.write(a.image, "png", outputfile)
puts a.image