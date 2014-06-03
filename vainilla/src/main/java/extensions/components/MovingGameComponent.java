package extensions.components;

import com.uqbar.vainilla.DeltaState;
import com.uqbar.vainilla.GameComponent;
import com.uqbar.vainilla.GameScene;
import com.uqbar.vainilla.UnitVector2D;
import com.uqbar.vainilla.appearances.Appearance;
import extensions.movements.Movable;

/**
 * GameComponent with velocity (speed and unit vector)
 */
public class MovingGameComponent<SceneType extends GameScene> extends GameComponent<SceneType> implements Movable {

	protected UnitVector2D uVector;
	protected double speed;

	public MovingGameComponent(Appearance appearance, double xPos, double yPos,
							   double xVec, double yVec, double speed) {
		super(appearance, xPos, yPos);
		this.uVector = new UnitVector2D(xVec, yVec);
		this.speed = speed;
	}

	@Override
	public void update(DeltaState deltaState) {
		move(deltaState);
		super.update(deltaState);
	}

	public void move(DeltaState deltaState) {
		setX(move(getX(), getUVector().getX(), getSpeedFactor(deltaState)));
		setY(move(getY(), getUVector().getY(), getSpeedFactor(deltaState)));
	}

	@Override
	public double move(double position, double uVectorProportion, double speedFactor) {
		return position + uVectorProportion * speedFactor;
	}

	public double getSpeedFactor(DeltaState deltaState) {
		return this.getSpeed() * deltaState.getDelta();
	}

	public double getSpeed() {
		return this.speed;
	}

	public void setSpeed(double speed) {
		this.speed = speed;
	}

	public UnitVector2D getUVector() {
		return this.uVector;
	}


}
