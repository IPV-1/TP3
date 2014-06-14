java_import Java::com.uqbar.vainilla.appearances.Sprite
java_import Java::resource.Resource


class ConfiguredResources
  attr_accessor :sprites, :config

  def initialize(config)
    self.sprites = {}
    self.config = config
  end

  def [](key)
    sprites[key]
  end

  def get_int(key)
    self.config.get_int(key)
  end

  def load_sprite(key)
    sprites[key] =  Resource.getImage self.config[key]
  end
end
