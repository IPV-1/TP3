package extensions.pools;

import java.util.Stack;

/**
 * Simple Pool class.
 * @param <Component>
 */
public abstract class Pool<Component> {

	private Stack<Component> components;

	public Pool(){
		setComponents(new Stack<Component>());
	}

	public int size(){
		return getComponents().size();
	}


	public void push(Component component) {
		getComponents().push(component);
	}

	public Component pop(){
		if(!getComponents().empty())
			return getComponents().pop();
		return createComponent();
	}

	public abstract Component createComponent();


	protected Stack<Component> getComponents() {
		return components;
	}

	private void setComponents(Stack<Component> components) {
		this.components = components;
	}
}
