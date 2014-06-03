package config;

import com.uqbar.vainilla.appearances.Sprite;
import resource.Resource;

import java.util.HashMap;
import java.util.Map;

public class ConfiguredResources {
	private Map<String, Sprite> sprites;
	private Config config;

	private ConfiguredResources() {
		setSprites(new HashMap<String, Sprite>());
	}

	public ConfiguredResources(Config config) {
		this();
		setConfig(config);
	}

	public Sprite getSprite(String key) {
		return getSprites().get(key);
	}

	public int getInt(String key){
		return getConfig().getInt(key);
	}

	public void loadSprite(String key) {
		getSprites().put(key, Resource.getImage(getConfig().get(key)));
	}

	private Map<String, Sprite> getSprites() {
		return sprites;
	}

	private void setSprites(Map<String, Sprite> sprites) {
		this.sprites = sprites;
	}

	private Config getConfig() {
		return this.config;
	}

	private void setConfig(Config config) {
		this.config = config;
	}
}
