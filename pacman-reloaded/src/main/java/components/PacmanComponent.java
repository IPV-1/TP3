package components;

import com.uqbar.vainilla.DeltaState;
import com.uqbar.vainilla.UnitVector2D;
import com.uqbar.vainilla.appearances.Appearance;
import com.uqbar.vainilla.events.constants.Key;
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


    public void update(DeltaState delta_state) {
        updateVector(delta_state, getUVector());
        if (can_move(delta_state))
            move(delta_state);
        super.update(delta_state);
    }

    public boolean can_move(DeltaState delta_state) {
        double x, y;
        x = shape.getX();
        y = shape.getY();
        double new_x = calculatePosition(x, getUVector().getX(), getSpeedFactor(delta_state));
        double new_y = calculatePosition(y, getUVector().getY(), getSpeedFactor(delta_state));
        return getScene().canOccupy((int) new_x, (int) new_y, shape);
    }

    public void move(DeltaState delta_state){
        setX(calculatePosition(getX(), getUVector().getX(), getSpeedFactor(delta_state)));
        setY(calculatePosition(getY(), getUVector().getY(), getSpeedFactor(delta_state)));
    }

    public double calculatePosition(double position, double uVectorProportion, double speedFactor){
        return position + uVectorProportion * speedFactor;
    }


    public void updateVector(DeltaState delta_state, UnitVector2D vector) {
        if (delta_state.isKeyPressed(Key.UP)) {
            vector.setY(-1);
            vector.setX(0);
        }
        if (delta_state.isKeyPressed(Key.DOWN)) {
            vector.setY(1);
            vector.setX(0);
        }
        if (delta_state.isKeyPressed(Key.RIGHT)) {
            vector.setX(1);
            vector.setY(0);
        }
        if (delta_state.isKeyPressed(Key.RIGHT)) {
            vector.setX(-1);
            vector.setY(0);
        }

    }

    public void setShape(Circle shape) {
        this.shape = shape;
    }
}
