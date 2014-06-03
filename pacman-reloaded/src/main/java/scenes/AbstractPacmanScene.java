package scenes;


import com.uqbar.vainilla.GameScene;
import pacman.PacmanGame;

/**
 * Common scene methods.
 */
public abstract class AbstractPacmanScene extends GameScene {

	@Override
	public PacmanGame getGame(){
		return (PacmanGame) super.getGame();
	}

}
