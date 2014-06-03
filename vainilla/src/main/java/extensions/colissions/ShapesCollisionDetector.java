package extensions.colissions;

import com.uqbar.vainilla.colissions.CollisionDetector;
import extensions.shapes.Circle;
import extensions.shapes.Rectangle;

public class ShapesCollisionDetector {
	private CollisionDetector collisionDetector = CollisionDetector.INSTANCE;

	private static ShapesCollisionDetector shapesCollisionDetector;

	public boolean collidesCircleAgainstRect(Circle circle, Rectangle rectangle) {
		return getCollisionDetector().collidesCircleAgainstRect(circle.getX(), circle.getY(), circle.getRatio(), rectangle.getX(), rectangle.getY(), rectangle.getWidth(), rectangle.getHeight());
	}

	public boolean collidesRectAgainstRect(Rectangle rectangle, Rectangle otherRectangle) {
		return getCollisionDetector().collidesRectAgainstRect(rectangle.getX(), rectangle.getY(), rectangle.getWidth(), rectangle.getHeight(), otherRectangle.getX(), otherRectangle.getY(), otherRectangle.getWidth(), otherRectangle.getHeight());
	}

	public boolean collidesCircleAgainstCircle(Circle circle, Circle otherCircle) {
		return getCollisionDetector().collidesCircleAgainstCircle(circle.getX(), circle.getY(), circle.getRatio(), otherCircle.getX(), otherCircle.getY(), otherCircle.getRatio());
	}

	public CollisionDetector getCollisionDetector() {
		return collisionDetector;
	}

	public static ShapesCollisionDetector getInstance() {
		if (shapesCollisionDetector == null) {
			shapesCollisionDetector = new ShapesCollisionDetector();
		}
		return shapesCollisionDetector;
	}

}
