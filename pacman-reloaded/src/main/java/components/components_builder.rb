require_relative './pacman'

class ComponentsBuilder

  def create_pacman(sprite)
    Pacman.new sprite, 0,0
  end
end