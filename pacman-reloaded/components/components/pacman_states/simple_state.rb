class SimpleState
  attr_accessor :appearance

  def initialize(appearance)
    self.appearance = appearance
  end

  def update(pacman, delta_state)
    #No op
  end

  def collides_with(pacman, ghost, scene_lifes)
    scene_lifes.value = scene_lifes.value - 1
  end

end