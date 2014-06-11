require 'java'

java_import Java::resource::Resource
java_import Java::javax.imageio.ImageIO
java_import Java::java.awt.image.BufferedImage
java_import Java::com.uqbar.vainilla.appearances.Sprite
java_import Java::java.awt.Color

class ColorParser
  attr_accessor :walking_matrix, :background

  def initialize
    self.walking_matrix = []
  end

  def parse(file)
    read_image(file) do |image,w, h|
      (0...h).each do |i|
        create_row(i, w, image)
      end
    end
    read_image(file) do |image,w, h|
      new_image = BufferedImage.new w, h, BufferedImage::TYPE_INT_ARGB
      graphics = new_image.createGraphics
      (0...h).each do |i|
        create_image_row(i, w, image, graphics)
      end
      graphics.dispose
      Sprite.new new_image
    end

  end

  def read_image(file)
    stream = Resource.java_class.resource file
    image = ImageIO.read stream
    w = image.width
    h = image.height
    yield image, w, h
  end

  def create_image_row(i, width, image, graphics)
    (0...width).each do |j|
      pixel = image.getRGB(j, i)
      g_image = image_for(pixel, image)
      graphics.draw_image(g_image, nil, j, i)
    end
  end

  def create_row(i, width, image)
    row = []
    (0...width).each do |j|
      puts "x,y: #{j}, #{i}"
      pixel = image.getRGB(j, i)
      puts "color: #{pixel}"
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
    new_image = BufferedImage.new 29, 15, BufferedImage::TYPE_INT_ARGB
    graphics = new_image.createGraphics
    graphics.color = (color == -324853 ? Color::RED : Color::BLUE)
    graphics.fill_rect( 0, 0, 29, 15)
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