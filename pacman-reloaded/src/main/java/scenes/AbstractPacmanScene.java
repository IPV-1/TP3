package scenes;


import com.uqbar.vainilla.GameScene;
import pacman.PacmanGame;

import java.util.List;

/**
 * Common scene methods.
 */
public class AbstractPacmanScene extends GameScene {

    private List<List<Boolean>> walkableMatrix;

	@Override
	public PacmanGame getGame(){
		return (PacmanGame) super.getGame();
	}

    public List<List<Boolean>> getWalkableMatrix() {
        return walkableMatrix;
    }

    public void setWalkableMatrix(List<List<Boolean>> walkableMatrix) {
        this.walkableMatrix = walkableMatrix;
    }

    public boolean canWalk(int x, int y){
        return getWalkableMatrix().get(y).get(x);
    }

}
