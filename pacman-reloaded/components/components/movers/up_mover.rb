require_relative '../movers/mover'
class UpMover < Mover

  def init_vector(component)
    component.uVector.y = -1
    component.uVector.x = 0
  end
end