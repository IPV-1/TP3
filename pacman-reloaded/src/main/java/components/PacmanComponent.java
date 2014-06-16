package components;

import com.uqbar.vainilla.GameComponent;
import com.uqbar.vainilla.appearances.Appearance;

import scenes.AbstractPacmanScene;

public class PacmanComponent extends GameComponent<AbstractPacmanScene>{

    public PacmanComponent(Appearance image, int i, int i1) {
        super(image, i, i1);
    }
}
