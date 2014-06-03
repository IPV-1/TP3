package extensions.shapes;


public abstract class SimpleShape implements Shape {
	private double relativeX;
	private double relativeY;
	private Shapeable shapeable;

	public SimpleShape(double relativeX, double relativeY) {
		setRelativeX(relativeX);
		setRelativeY(relativeY);
	}

	@Override
	public double getRelativeX() {
		return this.relativeX;
	}

	@Override
	public void setRelativeX(double relativeX) {
		this.relativeX = relativeX;
	}

	@Override
	public double getRelativeY() {
		return this.relativeY;
	}

	@Override
	public void setRelativeY(double relativeY) {
		this.relativeY = relativeY;
	}

	@Override
	public double getX() {
		return getShapeable().getX() + getRelativeX();
	}

	@Override
	public double getY() {
		return getShapeable().getY() + getRelativeY();
	}

	@Override
	public Shapeable getShapeable() {
		return this.shapeable;
	}

	public void setShapeable(Shapeable shapeable) {
		this.shapeable = shapeable;
	}
}
