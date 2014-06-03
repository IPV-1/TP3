package extensions.shapes;

/**
 * This interface represents the shape of a component.
 * Has a 'getRelativeX', which is not a absolute position in the game,
 * it's its position in relation to its component. Same for 'getRelativeY'.
 */
public interface Shape {

	/**
	 * relative X position in relation to component's x.
	 */
	public double getRelativeX();

	public void setRelativeX(double relativeX);

	/**
	 * relative Y position in relation to component's x.
	 */
	public double getRelativeY();

	public void setRelativeY(double relativeY);

	public boolean isColliding(Shape otherShape);

	public boolean isCollidedByRectangle(Rectangle rectangle);

	public boolean isCollidedByCircle(Circle circle);

	/**
	 * This method should return the absolute X position
	 */
	public double getX();

	/**
	 * This method should return the absolute Y position
	 */
	public double getY();

	/**
	 * Return a shapeable.
	 */
	public Shapeable getShapeable();

	void setShapeable(Shapeable shapeable);
}
