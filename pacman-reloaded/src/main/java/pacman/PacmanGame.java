package pacman;


import com.uqbar.vainilla.Game;
import com.uqbar.vainilla.appearances.Sprite;
import components.Pacman;
import components.PacmanComponent;
import config.Config;
import config.ConfiguredResources;
import extensions.shapes.Circle;
import map.Map;
import map.color.ColorParser;
import resource.Resource;
import scenes.PacmanScene;

import java.awt.*;

public class PacmanGame extends Game{

	private Config config;
	private ConfiguredResources resources;
	private Dimension displaySize;

	public PacmanGame(String configFile){
		super();
		setConfig(new Config(configFile));
		setResources(new ConfiguredResources(getConfig()));
		initializeConfigResources();
		setCurrentScene();
	}

	/**
	 * Set first scene here!
	 */
	private void setCurrentScene() {
        PacmanScene scene = new PacmanScene();
        Map map = new Map(new ColorParser(getConfig().getInt("blockSize")), "img/map.png");
        Sprite image = map.getBackground();

        PacmanComponent c = new PacmanComponent(image, 0, 0,1, 0, 0, new Circle(getConfig().getInt("blockSize"), 0, 0));
        scene.addComponent( c);
        scene.setList(map.getWalking_matrix());

        Sprite pacman = getResources().getSprite("pacmanImg");
        Pacman p = new Pacman(pacman, 1,0, 1, 0, 200, new Circle(getConfig().getInt("blockSize"), 0, 0));
        scene.addComponent(p);
        setCurrentScene(scene);
	}

	private void initializeConfigResources() {
		getResources().loadSprite("map");
		getResources().loadSprite("pacmanImg");
		setDisplaySize(new Dimension(getResources().getInt("screenWidth"), getResources().getInt("screenHeight")));

	}

	@Override
	protected void initializeResources() {
		//Use #initializeConfigResources() for loading resources from config files.
	}

	@Override
	protected void setUpScenes() {
		//Create, but do not set current scene, since config files are not loaded yet.
	}

	@Override
	public Dimension getDisplaySize() {
		return this.displaySize;
	}

	@Override
	public String getTitle() {
		return "Pacman reloaded";
	}

	public Config getConfig() {
		return config;
	}

	public void setConfig(Config config) {
		this.config = config;
	}

	public ConfiguredResources getResources() {
		return resources;
	}

	public void setResources(ConfiguredResources resources) {
		this.resources = resources;
	}

	public void setDisplaySize(Dimension displaySize) {
		this.displaySize = displaySize;
	}
	// Some stuff
}
