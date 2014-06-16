require 'java'

java_import Java::com.uqbar.vainilla.appearances.Sprite
java_import Java::com.uqbar.vainilla.exceptions.GameException
java_import Java::com.uqbar.vainilla.sound.Sound
java_import Java::com.uqbar.vainilla.sound.SoundBuilder
java_import Java::javax.imageio.ImageIO
java_import Java::java.awt.image.BufferedImage
java_import Java::java.io.InputStream


class Resource
  IMG_PACKAGE = 'img'
  SOUND_PACKAGE = 'sound'

  def self.resource_as_stream(file)
    path = "../../resources/resource/#{file}"
    java.io.FileInputStream.new(path)
  end

  def self.image_stream(file)
    path = "../../resources/resource/#{file}"
    java.io.FileInputStream.new(path)
  end

  def self.from_image(image_file_name)

    begin
      image = ImageIO.read(Resource.image_stream(image_file_name))
    rescue Exception => e
      puts e
      raise GameException.new "The resource '#{image_file_name}' was not found"
    end
    Sprite.new(image)
  end


  def self.image(file_name)

    from_image "#{IMG_PACKAGE}/#{file_name}"
  end


  def self.from_sound(filePath)
    i = Resource.java_class.resource_as_stream(filePath)
    SoundBuilder.buildSound i
  end

  def self.sound(fileName)
    from_sound "#{SOUND_PACKAGE}/#{fileName}"
  end
end
