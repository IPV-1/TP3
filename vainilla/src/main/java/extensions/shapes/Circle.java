package extensions.shapes;


import extensions.colissions.ShapesCollisionDetector;

public class Circle extends SimpleShape {
	private int ratio;

	public Circle(int ratio, double relativeX, double relativeY) {
		super(relativeX, relativeY);
		setRatio(ratio);
	}

	public double getDiameter() {
		return getRatio() * 2;
	}

	/************************/
	/*  getters and setters */

	/**
	 * ********************
	 */

	public int getRatio() {
		return ratio;
	}

	public void setRatio(int ratio) {
		this.ratio = ratio;
	}

	@Override
	public boolean isColliding(Shape otherShape) {
		return otherShape.isCollidedByCircle(this);
	}

	@Override
	public boolean isCollidedByRectangle(Rectangle rectangle) {
		return ShapesCollisionDetector.getInstance().collidesCircleAgainstRect(this, rectangle);
	}

	@Override
	public boolean isCollidedByCircle(Circle circle) {
		return ShapesCollisionDetector.getInstance().collidesCircleAgainstCircle(this, circle);
	}
}
