package extensions.shapes;


import extensions.colissions.ShapesCollisionDetector;

public class Rectangle extends SimpleShape {
	private int width;
	private int height;


	public Rectangle(int width, int height, double relativeX, double relativeY) {
		super(relativeX, relativeY);
		setWidth(width);
		setHeight(height);
	}

	/* ********************* */
	/*  getters and setters  */
	/* ********************* */


	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	@Override
	public boolean isColliding(Shape otherShape) {
		return otherShape.isCollidedByRectangle(this);
	}

	@Override
	public boolean isCollidedByRectangle(Rectangle rectangle) {
		return ShapesCollisionDetector.getInstance().collidesRectAgainstRect(this, rectangle);
	}

	@Override
	public boolean isCollidedByCircle(Circle circle) {
		return ShapesCollisionDetector.getInstance().collidesCircleAgainstRect(circle, this);
	}
}
