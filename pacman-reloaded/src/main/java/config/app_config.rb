require 'java'
require '../resource/resource'
java_import Java::java.util.Properties
java_import Java::java.io.IOException

class AppConfig
  attr_accessor :properties

  def initialize(config_file)
    load_file_configuration config_file
  end

  def [](key)
    properties.get(key).to_s
  end

  def get_int(key)
    self[key].to_i
  end

  def load_file_configuration(file)
      config_file_stream = Resource.resource_as_stream file
      p = Properties.new
      p.loadFromXML config_file_stream
      config_file_stream.close
      self.properties = p
  end

end