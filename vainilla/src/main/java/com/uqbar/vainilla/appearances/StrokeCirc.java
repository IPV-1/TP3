package com.uqbar.vainilla.appearances;


import java.awt.Color;
import java.awt.Graphics2D;

import com.uqbar.vainilla.GameComponent;

public class StrokeCirc implements Appearance {

	private Color color;
	private int diameter;

	// ****************************************************************
	// ** CONSTRUCTORS
	// ****************************************************************

	public StrokeCirc(Color color, int diameter) {
		this.color = color;
		this.diameter = diameter;
	}

	// ****************************************************************
	// ** QUERIES
	// ****************************************************************

	@Override
	public double getWidth() {
		return this.diameter;
	}

	@Override
	public double getHeight() {
		return this.diameter;
	}

	@Override
	@SuppressWarnings("unchecked")
	public StrokeCirc copy() {
		return new StrokeCirc(this.color, this.diameter);
	}

	// ****************************************************************
	// ** GAME LOOP OPERATIONS
	// ****************************************************************

	@Override
	public void update(double delta) {
	}

	@Override
	public void render(GameComponent<?> component, Graphics2D graphics) {
		graphics.setColor(this.color);
		graphics.drawOval((int) component.getX(), (int) component.getY(), this.diameter, this.diameter);
	}
}