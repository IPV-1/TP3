require_relative './simple_food'

class PowerFood < SimpleFood

  def eaten
    scene.power_pacman!
    super
  end
end