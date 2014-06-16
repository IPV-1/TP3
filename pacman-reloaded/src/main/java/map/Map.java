package map;

import com.uqbar.vainilla.appearances.Sprite;
import map.color.ColorParser;

import java.util.List;

public class Map {
    private List<List<Boolean>> walking_matrix;
    private Sprite background;

    public Map(ColorParser parser, String file_name){
        parser.parse(file_name);
        this.setBackground(parser.getBackground());
        //this.setWalking_matrix(parser.getWalkingMatrix());
    }

    public boolean isWalkable(int x, int y){
        return getWalking_matrix().get(y).get(y);
    }

    public Sprite getBackground() {
        return background;
    }

    public void setBackground(Sprite background) {
        this.background = background;
    }

    public List<List<Boolean>> getWalking_matrix() {
        return walking_matrix;
    }

    public void setWalking_matrix(List<List<Boolean>> walking_matrix) {
        this.walking_matrix = walking_matrix;
    }
}
