package config;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Properties;

public class Config {
	private Properties properties;

	public Config(String configFile) {
		loadFileConfiguration(configFile);
	}

	public String get(String key){
		return (String) getProperties().get(key);
	}

	public int getInt(String key) {
		return Integer.parseInt(get(key));
	}

	private void loadFileConfiguration(String file) {
		URL configFile = Config.class.getResource(file);
		try {
			InputStream configFileStream = configFile.openStream();
			Properties p = new Properties();
			p.loadFromXML(configFileStream);
			configFileStream.close();
			setProperties(p);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

	}

	private void setProperties(Properties properties) {
		this.properties = properties;
	}

	private Properties getProperties() {
		return properties;
	}

}
