package map.color;


import com.uqbar.vainilla.appearances.Sprite;
import resource.Resource;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ColorParser {

    public static Map<Integer, Color> colorMap = new HashMap<Integer, Color>();

    static {
        colorMap.put(-324853, Color.RED);
        colorMap.put(-1, Color.BLUE);
        colorMap.put(-301813, Color.ORANGE);
        colorMap.put(-16046085 , Color.LIGHT_GRAY);
        colorMap.put(-14550261, Color.BLACK);
        colorMap.put(-787701, Color.PINK);
        colorMap.put(-277237, Color.YELLOW);
    }

    private int blockSize;
    private Sprite background;
    private List<List<Boolean>> walkingMatrix;

    public ColorParser(int blockSize){
        setBlockSize(blockSize);
        setWalkingMatrix(new ArrayList<List<Boolean>>());

    }

    public void parse(String file){
        createBackground(file);
        create_walking_matrix(file);
        //self.background
    }

    private void create_walking_matrix(String file) {
        InputStream stream = Resource.class.getResourceAsStream(file);
        BufferedImage image;
        try {
            image = ImageIO.read(stream);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        int i = image.getWidth();
        int h = image.getHeight();

        for (int j = 0; j <h; j++) {
            create_row(j, i, image);
        }
        try {
            stream.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void create_row(int i,int  width,BufferedImage image){
        List<Boolean>row = new ArrayList<Boolean>();
        for (int j = 0; j < width; j++) {
            int pixel = image.getRGB(j, i);
            row.add(booleanFor(pixel));
        }
        addRow(row);
    }

    public void  addRow(List<Boolean>row){
        getWalkingMatrix().add(row);
    }

    public boolean booleanFor(int color){
     return color != -324853;
    }

    public void createBackground(String file) {
        InputStream stream = Resource.class.getResourceAsStream(file);
        BufferedImage image;
        try {
            image = ImageIO.read(stream);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        int i = image.getWidth();
        int h = image.getHeight();



        BufferedImage new_image = new BufferedImage(i * getBlockSize(), h * getBlockSize(), BufferedImage.TYPE_INT_ARGB);
        Graphics2D graphics = new_image.createGraphics();
        for (int j = 0; j < h; j++) {
          create_image_row(j, i, image, graphics);
        }
        graphics.dispose();
        setBackground(new Sprite(new_image));


        try {
            stream.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    public void create_image_row(int row_number, int width, BufferedImage image, Graphics2D graphics){
        for (int i = 0; i < width; i++) {
            int pixel = image.getRGB(i, row_number);
            BufferedImage g_image = image_for(pixel, image);
            graphics.drawImage(g_image, null, i* getBlockSize(), row_number * getBlockSize());
        }
    }

    public BufferedImage image_for(int color, BufferedImage image){
        BufferedImage newImage = new BufferedImage(getBlockSize(), getBlockSize(), BufferedImage.TYPE_3BYTE_BGR);
        Graphics graphics = newImage.createGraphics();
        Color kolor = colorMap.get(color);
        graphics.setColor(kolor);
        graphics.fillRect(0,0,getBlockSize(), getBlockSize());
        graphics.dispose();
        return newImage;
    }

    public int getBlockSize() {
        return blockSize;
    }

    public void setBlockSize(int blockSize) {
        this.blockSize = blockSize;
    }

    public List<List<Boolean>> getWalkingMatrix() {
        return walkingMatrix;
    }

    public void setWalkingMatrix(List<List<Boolean>> walkingMatrix) {
        this.walkingMatrix = walkingMatrix;
    }

    public Sprite getBackground() {
        return background;
    }

    public void setBackground(Sprite background) {
        this.background = background;
    }
}
