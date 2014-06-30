require_relative '../basic_pacman_component'

class Ghost < BasicPacmanComponent
  attr_accessor :count, :rotation


  def update(delta_state)
    fix_position
    if count.nil?
      self.count = 0
    end
    if rotation.nil?
      self.rotation = -1
    end
    if can_move? delta_state
      move(delta_state)
    else
      rotate
      self.count = count + 1
      if count == 2
        self.count = 0
        self.rotation *= -1
      end
    end
  end

  def rotate
    if rotation < 0
      if uVector.x == 0
        if uVector.y > 0
          uVector.x = 1
        else
          uVector.x = -1
        end
        uVector.y = 0
      else
        if uVector.x > 0
          uVector.y = -1
        else
          uVector.y = 1
        end
        uVector.x = 0
      end
    else
      if uVector.x == 0
        if uVector.y > 0
          uVector.x = -1
        else
          uVector.x = 1
        end
        uVector.y = 0
      else
        if uVector.x > 0
          uVector.y = 1
        else
          uVector.y = -1
        end
        uVector.x = 0
      end

    end
  end


end