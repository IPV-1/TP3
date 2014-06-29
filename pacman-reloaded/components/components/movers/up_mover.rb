require_relative '../movers/mover'
class UpMover < Mover

  def init_vector(component)
    component.uVector.y = -1
    component.uVector.x = 0
  end

  def rotare_appearance(component)
    component.appearance = component.original_appearance.rotate(- self.pi/ 2)
  end
end