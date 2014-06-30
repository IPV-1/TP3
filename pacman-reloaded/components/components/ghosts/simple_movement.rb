class SimpleMovement
  attr_accessor :count, :rotation, :max_rotations

  def initialize
    self.max_rotations = 3
    self.count = 0
    self.rotation = -1
  end

  def move(ghost, delta_state)
    ghost.move delta_state
  end

  def rotate(ghost)
    #TODO: GOD! This scares
    if ghost.uVector.x == 0
      ghost.uVector.x = ghost.uVector.y * rotation
      ghost.uVector.y = 0
    else
      ghost.uVector.y = ghost.uVector.x * rotation
      ghost.uVector.x = 0
    end
    self.count = count + 1
    if count == max_rotations
      self.count = 0
      self.rotation *= -1
    end
  end


end