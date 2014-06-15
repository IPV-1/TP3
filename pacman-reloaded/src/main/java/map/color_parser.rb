require 'java'

java_import Java::resource.Resource
java_import Java::javax.imageio.ImageIO
java_import Java::java.awt.image.BufferedImage
java_import Java::com.uqbar.vainilla.appearances.Sprite
java_import Java::java.awt.Color

class ColorParser
  attr_accessor :walking_matrix, :background, :block_size

  COLOR_HASH = {
      -324853 => Color::RED,
      -1 => Color::BLUE,
      -301813 => Color::ORANGE,
      -16046085 => Color::LIGHT_GRAY,
      -14550261 => Color::BLACK,
      -787701 => Color::PINK,
      -324638 => Color::GREEN,
      -277237 => Color::YELLOW
  }

  def initialize(block_size)
    self.block_size = block_size
    self.walking_matrix = []
  end

  def parse(file)
    create_walking_matrix(file)
    create_background(file)
  end

  def create_background(file)
    read_image(file) do |image,width, height|
      new_image = BufferedImage.new width * block_size, height * block_size, BufferedImage::TYPE_INT_ARGB
      graphics = new_image.createGraphics
      (0...height).each do |row_number|
        create_image_row(row_number, width, image, graphics)
      end
      graphics.dispose
      self.background = Sprite.new new_image
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
    stream = Resource.getResourceAsStream file
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
      graphics.draw_image(g_image, nil, column_number* block_size, row_number * block_size)
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

  def image_for(color, image)
    new_image = BufferedImage.new block_size, block_size, BufferedImage::TYPE_INT_ARGB
    graphics = new_image.createGraphics
    puts color
    kolor = COLOR_HASH[color]
    if kolor.blank?
      raise "No color found for #{color}"
    end
    graphics.color = kolor
    graphics.fill_rect( 0, 0, block_size, block_size)
    graphics.dispose
    new_image
  end
end