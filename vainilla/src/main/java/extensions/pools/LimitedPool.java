package extensions.pools;

/**
 * Simple Pool class.
 *
 * @param <Component>
 */
public abstract class LimitedPool<Component> extends Pool<Component> {

	private int limit;

	public LimitedPool(int limit) {
		setLimit(limit);
	}

	public LimitedPool(){
		setLimit(10);
	}

	public void push(Component component) {
		if(size() < getLimit())
			super.push(component);
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}
}
