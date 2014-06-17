package components;

import com.uqbar.vainilla.DeltaState;
import com.uqbar.vainilla.appearances.Appearance;
import extensions.components.MovingGameComponent;
import extensions.shapes.Circle;
import extensions.shapes.Shapeable;
import scenes.AbstractPacmanScene;
import scenes.PacmanScene;

public class PacmanComponent extends MovingGameComponent<AbstractPacmanScene> implements Shapeable{
    private Circle shape;

    public PacmanComponent(Appearance appearance, double xPos, double yPos,
                           double xVec, double yVec, double speei1, Circle shape) {
        super(appearance, xPos, yPos, xVec, yVec, speei1);
        setShape(shape);
        shape.setShapeable(this);

    }

    @Override
    public PacmanScene getScene() {
        return (PacmanScene) super.getScene();
    }


    public boolean can_move(DeltaState delta_state) {
        double new_x = move(getX(), getUVector().getX(), getSpeedFactor(delta_state));
        double new_y = move(getY(), getUVector().getX(), getSpeedFactor(delta_state));
        return getScene().canOccupy(new_x, new_y, shape);
    }

    public void setShape(Circle shape) {
        this.shape = shape;
    }
}
