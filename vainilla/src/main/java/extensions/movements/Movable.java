package extensions.movements;


import com.uqbar.vainilla.DeltaState;
import com.uqbar.vainilla.UnitVector2D;


/**
 * Defines a movable object. It can be moved by a deltaState and a speed.
 */
public interface Movable {

	public void move(DeltaState deltaState);

	public double move(double position, double uVectorProportion, double speedFactor);

	public double getSpeedFactor(DeltaState deltaState);

	public double getSpeed();

	public UnitVector2D getUVector();

	public double getX();

	public double getY();

}
