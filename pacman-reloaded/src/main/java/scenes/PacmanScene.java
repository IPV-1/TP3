package scenes;


import extensions.shapes.Circle;
import extensions.shapes.Shape;

import java.util.ArrayList;
import java.util.List;

public class PacmanScene extends AbstractPacmanScene {
    private List<List<Boolean>> list = new ArrayList<List<Boolean>>();

    public boolean canOccupy(double  x, double y, Circle circle) {
        return can_walk(to_b(x), to_b(y)) && can_walk(to_b(x + circle.getDiameter()), to_b(y)) &&
                can_walk(to_b(x), to_b(y + circle.getDiameter())) &&
                can_walk(to_b(x + circle.getDiameter()), to_b(y + circle.getDiameter()));
    }

    public int to_b(double coord) {
        return (int) (coord / block_size());
    }

    public int block_size() {
        return getGame().getConfig().getInt("blockSize");
    }

    public boolean can_walk(int x, int y) {

        return getList().get(y).get(x);
    }


    public List<List<Boolean>> getList() {
        return list;
    }

    public void setList(List<List<Boolean>> list) {
        this.list = list;
    }
}
