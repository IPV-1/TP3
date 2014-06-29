require_relative '../movers/mover'
class LeftMover < Mover
  def init_vector(component)
    component.uVector.x = -1
    component.uVector.y = 0
  end

  def rotare_appearance(component)
    component.appearance = component.original_appearance.rotate(self.pi)
  end
end