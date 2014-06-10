require 'java'

java_import Java::resource::Resource
java_import Java::javax.imageio.ImageIO

class ColorParser
  attr_accessor :walking_matrix

  def initialize
    self.walking_matrix = []
  end

  def parse(file)
    stream = Resource.java_class.resource file
    image = ImageIO.read stream
    w = image.width
    h = image.height
    (0...h).each do |i|
      create_row(i, w, image)
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

  def background

  end
end


c = ColorParser.new
c.parse 'img/map.png'
puts c.walking_matrix.size
puts [[1,2][3,4]]