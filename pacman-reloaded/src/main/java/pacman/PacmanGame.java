package pacman;


import com.uqbar.vainilla.Game;
import config.Config;
import config.ConfiguredResources;

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

	}

	private void initializeConfigResources() {
		getResources().loadSprite("map");
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
