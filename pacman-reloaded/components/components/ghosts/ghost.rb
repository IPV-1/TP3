require_relative '../basic_pacman_component'

class Ghost < BasicPacmanComponent
  attr_accessor :count, :rotation

  def initialize(shape, appearance, x, y, x_vector, y_vector, speed)
    super
    self.count = 0
    self.rotation = -1
  end


  def update(delta_state)
    fix_position
    if can_move? delta_state
      move(delta_state)
    else
      rotate
      self.count = count + 1
      if count == 3
        self.count = 0
        self.rotation *= -1
      end
    end
  end

  def rotate
    #TODO: GOD! This scares
      if uVector.x == 0
        uVector.x = uVector.y * rotation
        uVector.y = 0
      else
        uVector.y = uVector.x * rotation
        uVector.x = 0
      end
  end


end