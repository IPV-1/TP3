require_relative '../movers/mover'

class RightMover < Mover
  def init_vector(component)
    component.uVector.x = 1
    component.uVector.y = 0
  end
end