package launcher;

import com.uqbar.vainilla.DesktopGameLauncher;
import pacman.PacmanGame;

public class Launcher {

	public static void main(String[] args) throws Exception {
		new DesktopGameLauncher(new PacmanGame("application.xml")).launch();
	}
}