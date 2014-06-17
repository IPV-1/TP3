package components;


import com.uqbar.vainilla.DeltaState;
import com.uqbar.vainilla.UnitVector2D;
import com.uqbar.vainilla.appearances.Appearance;
import com.uqbar.vainilla.events.constants.Key;
import extensions.shapes.Circle;

public class Pacman extends PacmanComponent{

    public Pacman(Appearance appearance, double xPos, double yPos, double xVec, double yVec, double speei1, Circle shape) {
        super(appearance, xPos, yPos, xVec, yVec, speei1, shape);
    }

    public void update(DeltaState delta_state) {
        updateVector(delta_state, getUVector());
        if (can_move(delta_state))
            super.update(delta_state);
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
        if (delta_state.isKeyPressed(Key.LEFT)) {
            vector.setX(-1);
            vector.setY(0);
        }

    }

}
